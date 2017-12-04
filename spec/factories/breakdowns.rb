# frozen_string_literal: true

FactoryBot.define do
  factory :breakdown do
    category
    sequence(:name) { |i| "内訳#{i}" }
  end
end
