class TasksWizardController < ApplicationController

  # step 1, identify tasks
  def list
    @plan = current_user.plans.find(params[:plan_id])
  end

  # step 2, rate importance level of tasks
  def rate
  end

  # step 3, assign a position or person to do action
  def assign
  end

  # step 4, decide what tasks will be included per position/person, reviewing overall workload
  def include
  end

  # step 5, arrange order of tasks execution
  def position
  end

  # step 6, give todos for tasks which are included but not ready
  def preparation
  end
end
