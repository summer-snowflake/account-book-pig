FactoryGirl.define do
  factory :user do
    trait :inactive do
      status :inactive
    end
    trait :registered do
      status :registered
    end
    last_sign_in_at { 2.days.ago }

    factory :email_user, class: EmailUser do
      sequence(:email) { |n| "email#{n}@example.com" }
      password { 'password' }
      type 'EmailUser'
    end

    factory :twitter_user, class: TwitterUser do
      type 'TwitterUser'
    end
  end
end