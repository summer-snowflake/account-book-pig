# frozen_string_literal: true

class Api::Admin::Tasks::DoneTasksController < ApplicationController
  before_action :authenticate
  before_action :admin_authenticate

  def create
    yesterday = Time.zone.yesterday
    DoneTask.transaction do
      DoneTask.where(end_on: yesterday).delete_all
      diff_tasks = AllDoneTask.achievements_of(yesterday)
      diff_tasks.each do |board_name, card_name|
        DoneTask.create!(end_on: yesterday,
                         board_name: board_name, card_name: card_name)
      end
    end
    @tasks = DoneTask.where(end_on: yesterday)
  end
end
