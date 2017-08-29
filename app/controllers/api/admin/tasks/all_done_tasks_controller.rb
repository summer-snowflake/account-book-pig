# frozen_string_literal: true

class Api::Admin::Tasks::AllDoneTasksController < ApplicationController
  before_action :authenticate
  before_action :admin_authenticate

  def create
    fetcher = AllDoneTask::Fetcher.new(task_params)
    if fetcher.save_all
      head 201
    else
      render_error fetcher
    end
  end

  private

  def task_params
    params.permit(:board_id, :list_id)
  end
end
