# frozen_string_literal: true

class AllDoneTask < ApplicationRecord
  validates :confirmed_on, :list_code, :card_code, :card_name, presence: true

  # 確認日「今日」のDoneカードを再登録する
  def self.recreate_all!(list_code, cards)
    AllDoneTask.where(confirmed_on: Time.zone.today, list_code: list_code)
               .delete_all
    cards.each do |card|
      AllDoneTask.create!(confirmed_on: Time.zone.today, list_code: list_code,
                          card_code: card['id'], card_name: card['name'])
    end
  end
end
