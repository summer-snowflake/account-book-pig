# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DoneTask, type: :model do
  it { is_expected.to validate_presence_of(:end_on) }
  it { is_expected.to validate_presence_of(:card_name) }
end
