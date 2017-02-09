# frozen_string_literal: true
FactoryGirl.define do
  factory :tagged_record do
    record
    tag
  end
end
