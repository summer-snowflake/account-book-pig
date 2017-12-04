# frozen_string_literal: true

FactoryBot.define do
  factory :record do
    published_on Time.zone.today
    user
    category
    breakdown
    place
    charge { rand(0..10_000) }
    sequence(:memo) { |i| "めも#{i}" }
  end
end
