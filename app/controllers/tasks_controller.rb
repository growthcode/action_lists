class TasksController < ApplicationController

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
    positioned.each_with_index do |id, index|
      task = Task.find(id)
      task.position = index + 1
      task.inbox = false
      task.save
    end
    render json: positioned
  end
end
