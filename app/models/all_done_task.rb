# frozen_string_literal: true

class AllDoneTask < ApplicationRecord
  validates :confirmed_on, :board_name, :list_code, :card_code, :card_name,
            presence: true

  # 確認日「今日」のDoneカードを再登録する
  def self.recreate_all!(board_name, list_code, cards)
    raise '終了したカードがありません' if cards.blank?

    AllDoneTask.where(confirmed_on: Time.zone.today, list_code: list_code)
               .delete_all
    cards.each do |card|
      AllDoneTask.create!(confirmed_on: Time.zone.today,
                          board_name: board_name, list_code: list_code,
                          card_code: card['id'], card_name: card['name'])
    end
  end

  scope :the_day, ->(target_day) { where(confirmed_on: target_day) }

  # 1日の実績を取得する
  def self.achievements_of(end_on)
    keys = %i[board_name card_name]
    the_day(end_on).pluck(*keys) - the_day(end_on - 1.day).pluck(*keys)
  end
end
