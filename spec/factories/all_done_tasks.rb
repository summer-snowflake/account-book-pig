# frozen_string_literal: true

FactoryBot.define do
  factory :all_done_task do
    confirmed_at Time.zone.now
    list_code SecureRandom.hex(12)
    card_code SecureRandom.hex(12)
    sequence(:card_name) { |i| "カードの名前#{i}" }
    sequence(:board_name) { |i| "ボードの名前#{i}" }
  end
end
