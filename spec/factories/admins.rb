FactoryGirl.define do
  factory :admin do
    trait(:with_user) do
      user
    end
  end
end
