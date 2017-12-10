# frozen_string_literal: true

FactoryBot.define do
  factory :auth do
    user_id { create(:user, :registered, type: 'TwitterUser').id }
    provider 'twitter'
    sequence(:screen_name) { |n| "name#{n}" }
    sequence(:name) { |n| "名前#{n}" }
  end
end
