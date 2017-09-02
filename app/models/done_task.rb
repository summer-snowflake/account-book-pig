# frozen_string_literal: true

class DoneTask < ApplicationRecord
  validates :end_on, :board_name, :card_name, presence: true

  # 終了カードを再登録する
  def self.recreate!(target_date)
    tasks = DoneTask.where(end_on: target_date)
    exists_tasks = tasks.pluck(:board_name, :card_name)
    diff_tasks = AllDoneTask.achievements_of(target_date)
    return tasks if exists_tasks == diff_tasks

    tasks.delete_all
    diff_tasks.each do |board_name, card_name|
      DoneTask.create!(end_on: target_date,
                       board_name: board_name, card_name: card_name)
    end
    DoneTask.where(end_on: target_date)
  end
end
