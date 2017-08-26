# frozen_string_literal: true

class Api::Admin::Tasks::AllDoneTasksController < ApplicationController
  before_action :authenticate
  before_action :admin_authenticate

  def create
    fetcher = AllDoneTask::Fetcher.new
    if fetcher.save_all
      head 201
    else
      render_error fetcher
    end
  end
end
