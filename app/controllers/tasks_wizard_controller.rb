class TasksWizardController < ApplicationController

  # step 1, identify tasks
  def list
    @plan = current_user.plans.find(params[:plan_id])
    @tasks = @plan.tasks.order(:created_at).reverse
    @task = Task.new
    @previous_step_path = plan_path(@plan.id)
    @next_step_path = plans_wizard_rate_path(@plan.id)
  end

  def create_task
    @plan = @plans.find(params[:plan_id])
    @task = @plan.tasks.new(task_params)
    if @task.save
      taskRow = render_to_string(partial: 'tasks_wizard/list_task',locals: {task: @task})
      render json: {taskRow: taskRow}
    else
      render json: {error: "Task did not save"}
    end
  end

  # step 2, rate importance level of tasks
  def rate
    @plan = current_user.plans.find(params[:plan_id])
    @tasks = @plan.tasks.where(priority: nil)
    @previous_step_path = plans_wizard_list_path(@plan.id)
    @next_step_path = plans_wizard_assign_path(@plan.id)
  end

  def rate_update
    @plan = @plans.find(params[:plan_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: {result: 'success'}
    else
      render json: {result: 'error'}
    end
  end

  # step 3, assign a position or person to do action
  def assign
    @plan = current_user.plans.find(params[:plan_id])
    @tasks = @plan.tasks.order(:priority).where(role: nil)
    @role = Role.new
    @roles = @plan.roles
    @previous_step_path = plans_wizard_rate_path(@plan.id)
    @next_step_path = plans_wizard_include_path(@plan.id)
  end

  def assign_update
    @plan = @plans.find(params[:plan_id])
    @task = @plan.tasks.find(params[:id])

    if params[:task][:role_id].present?
      if @task.update(task_params)
        render json: {result: "Successfully updated role.", rolePresent: true}
      else
        render json: {result: "Error, did not save.", rolePresent: false}
      end
    else
      render json: {result: "Did not select a role.", rolePresent: false}
    end
  end

  def create_role
    @role = current_user.plans.find(params[:plan_id]).roles.new(doer: params[:role][:doer])
    if @role.doer.present? && @role.save
      flash[:notice] = "Role saved"
      redirect_to action: :assign
    else
      flash[:warning] = "Role did not save"
      redirect_to action: :assign
    end
  end

  # step 4, decide what tasks will be included per position/person, reviewing overall workload
  def include
    @plan = current_user.plans.find(params[:plan_id])
    @tasks = @plan.tasks.order('priority ASC')
    @previous_step_path = plans_wizard_assign_path(@plan.id)
    @next_step_path = plans_wizard_position_path(@plan.id)
    @unfiltered = true
  end

  def include_sort
    @role_id = params[:sort][:role_id].to_i
    sort_number = params[:sort][:order].to_i
    @plan = @plans.find(params[:plan_id])
    @previous_step_path = plans_wizard_assign_path(@plan.id)
    @next_step_path = plans_wizard_position_path(@plan.id)
    @unfiltered = true
    if @role_id.present?
      @tasks = @plan.tasks.where(role_id: @role_id).order(include_sort_value(sort_number))
      @unfiltered = false
    # else
      @tasks = @plan.tasks.order(include_sort_value(sort_number))
    end
    render :include
  end

  def include_toggle
    @plan = @plans.find(params[:plan_id])
    @task = @plan.tasks.find(params[:id])
    if @task.update(task_params)
      render json: {state: @task.included, result: "Task was saved"}
    else
      render status: 400
    end
  end

  # step 5, arrange order of tasks execution
  def position
    @plan = current_user.plans.find(params[:plan_id])
    @previous_step_path = plans_wizard_include_path(@plan.id)
    @next_step_path = plans_wizard_preparation_path(@plan.id)
  end

  # step 6, give todos for tasks which are included but not ready
  def preparation
    @plan = current_user.plans.find(params[:plan_id])
    @previous_step_path = plans_wizard_position_path(@plan.id)
    @next_step_path = plan_path(@plan.id)
  end

  private

  def task_params
    params.require(:task).permit(:deed, :description, :role, :person, :priority, :position, :included, :inbox, :minutes, :plan_id, :role_id)
  end

  def include_sort_value(number)
    #include_action_sort_options helper based off of
    case number
    when 1 || '1'
      'priority ASC'
    when 2 || '2'
      'priority DESC'
    end
  end
end
