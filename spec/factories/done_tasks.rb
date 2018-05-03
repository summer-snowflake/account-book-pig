# frozen_string_literal: true

FactoryBot.define do
  factory :done_task do
    end_on Time.zone.yesterday
    sequence(:board_name) { |i| "ボードの名前#{i}" }
    sequence(:card_name) { |i| "カードの名前#{i}" }
  end
end
