# frozen_string_literal: true

class DoneTask < ApplicationRecord
  validates :end_on, :board_name, :card_name, presence: true

  def add_achievements
    diff_tasks = AllDoneTask.achievements_of(Time.zone.yesterday)
p diff_tasks.count
  end
end
