# frozen_string_literal: true

FactoryBot.define do
  factory :tally do
    user
    year [*2010..2016].sample
    month [*1..12].sample
    list '[]'
  end
end
