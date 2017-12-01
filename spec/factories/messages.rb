# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    user
    trait :with_feedback do
      feedback
    end
    sequence(:content) { |n| "メッセージ内容#{n}" }
    read false
    sent_at { Time.zone.now }
  end
end
