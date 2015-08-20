class TasksController < ApplicationController

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
