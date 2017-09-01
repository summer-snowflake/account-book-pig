# frozen_string_literal: true

class Api::Admin::Tasks::DoneTasksController < ApplicationController
  before_action :authenticate
  before_action :admin_authenticate

  def create
    DoneTask.transaction do
      DoneTask.where(end_on: Time.zone.today).delete_all
      diff_tasks = AllDoneTask.achievements_of(Time.zone.yesterday)
      diff_tasks.each do |board_name, card_name|
        DoneTask.create!(end_on: Time.zone.yesterday, board_name: board_name, card_name: card_name)
      end
    end
    head DoneTask.where(end_on: Time.zone.today).exists? ? 201 : 200
  end
end
