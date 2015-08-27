class TasksWizardController < ApplicationController

  # step 1, identify tasks
  def list
    @plan = current_user.plans.find(params[:plan_id])
    @previous_step_path = plan_path(@plan.id)
    @next_step_path = plans_wizard_rate_path(@plan.id)
  end

  # step 2, rate importance level of tasks
  def rate
    @plan = current_user.plans.find(params[:plan_id])
    @previous_step_path = plans_wizard_list_path(@plan.id)
    @next_step_path = plans_wizard_assign_path(@plan.id)
  end

  # step 3, assign a position or person to do action
  def assign
    @plan = current_user.plans.find(params[:plan_id])
    @previous_step_path = plans_wizard_rate_path(@plan.id)
    @next_step_path = plans_wizard_include_path(@plan.id)
  end

  # step 4, decide what tasks will be included per position/person, reviewing overall workload
  def include
    @plan = current_user.plans.find(params[:plan_id])
    @previous_step_path = plans_wizard_assign_path(@plan.id)
    @next_step_path = plans_wizard_position_path(@plan.id)
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
end
