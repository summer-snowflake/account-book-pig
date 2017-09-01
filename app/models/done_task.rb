# frozen_string_literal: true

class DoneTask < ApplicationRecord
  validates :end_on, :board_name, :card_name, presence: true
end
