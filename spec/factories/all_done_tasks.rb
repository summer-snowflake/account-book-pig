FactoryGirl.define do
  factory :all_done_task do
    confirmed_on Time.zone.today
    card_code SecureRandom.hex(12)
    sequence(:card_name) { |i| "カードの名前#{i}" }
  end
end
