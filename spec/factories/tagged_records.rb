# frozen_string_literal: true

FactoryBot.define do
  factory :tagged_record do
    record
    tag
  end
end
