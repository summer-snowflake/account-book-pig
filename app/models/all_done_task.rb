# frozen_string_literal: true

class AllDoneTask < ApplicationRecord
  validates :confirmed_on, :list_code, :card_code, :card_name, presence: true
end
