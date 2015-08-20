class TasksController < ApplicationController

  def sort_inbox
    inbox = params[:inbox]
    inbox.each_with_index do |id, index|
      task = Task.find(id)
      task.position = nil
      task.save
    end
    render json: inbox
  end
  def sort_positioned
    positioned = params[:positioned]
    positioned.each_with_index do |id, index|
      task = Task.find(id)
      task.position = index + 1
      task.save
    end
    render json: positioned
  end
end
