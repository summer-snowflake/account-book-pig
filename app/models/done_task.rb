# frozen_string_literal: true

class DoneTask < ApplicationRecord
  validates :end_on, :card_name, presence: true
end
