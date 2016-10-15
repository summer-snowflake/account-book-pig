# frozen_string_literal: true
FactoryGirl.define do
  factory :auth do
    provider ''
    sequence(:screen_name) { |n| "name#{n}" }
    sequence(:name) { |n| "名前#{n}" }
  end
end
