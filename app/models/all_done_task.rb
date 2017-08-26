# frozen_string_literal: true

class AllDoneTask < ApplicationRecord
  validates :confirmed_on, :card_code, :card_name, presence: true
end
