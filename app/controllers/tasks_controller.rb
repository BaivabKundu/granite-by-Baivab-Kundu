# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    tasks = Task.all
    render status: :ok, json: { tasks: }
  end

  def create
    task = Task.new(task_params)
    puts task
    task.save!
    render_notice(t("successfully_created"))
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end
end
