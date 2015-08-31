class TasksController < ApplicationController
  before_action :set_task, only: [:edit_modal]

  def edit_modal
    modal = render_to_string(partial: 'tasks/edit_modal')
    render json: {modal: modal}
  end

  def update
    @plan = @plans.find(params[:plan_id])
    @plan.tasks.find(params[:id]).update(task_params)
    redirect_to :back
  end

  def create
    @plan = @plans.find(params[:plan_id])
    task_deed = params[:taskDeed]
    @task = @plan.tasks.new(deed: task_deed)
    if @task.save
      task_li = render_to_string(partial: 'plans/task', layout: false, locals: {task: @task})
      render json: {taskLi: task_li}
    else
      render json: {error: "Task did not save"}
    end
  end

  def destroy
    @plan = @plans.find(params[:plan_id])
    @task = Task.find(params[:id])
    task_position = @task.position
    tasks_array = @plan.tasks.select([:id, :position]).where("position > ?", "#{task_position}")
    tasks_array.each do |task|
      task.position -= 1
      task.save
    end
    @task.destroy
    respond_to do |format|
      format.html { redirect_to plan_path(@plan), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def sort_inbox
    inbox = params[:tasks]
    inbox.each_with_index do |id, index|
      task = Task.find(id)
      task.position = index + 1
      task.inbox = true
      task.save
    end
    render json: inbox
  end

  def sort_positioned
    positioned = params[:tasks]
    @plan = Plan.find(params[:plan_id])
    @plan.tasks.each do |task|
      if positioned.include?(task.id.to_s)
        index = positioned.index(task.id.to_s)
        task.position = index + 1
        task.included = true
        task.inbox = false
        task.save
      else
        task.position = nil
        # task.included = false
        task.inbox = true
        task.save
      end
    end
    render json: positioned
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:deed, :description, :role, :person, :priority, :position, :included, :inbox, :minutes, :plan_id)
  end
end
