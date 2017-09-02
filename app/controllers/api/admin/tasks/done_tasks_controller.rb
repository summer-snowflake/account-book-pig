# frozen_string_literal: true

class Api::Admin::Tasks::DoneTasksController < ApplicationController
  before_action :authenticate
  before_action :admin_authenticate

  def index
    @tasks = DoneTask.recreate!(Time.zone.yesterday)
  end
end
