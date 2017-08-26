# frozen_string_literal: true

FactoryGirl.define do
  factory :done_task do
    end_on Time.zone.yesterday
    sequence(:card_name) { |i| "カードの名前#{i}" }
  end
end
