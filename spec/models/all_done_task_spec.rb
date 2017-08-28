# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AllDoneTask, type: :model do
  it { is_expected.to validate_presence_of(:confirmed_on) }
  it { is_expected.to validate_presence_of(:list_code) }
  it { is_expected.to validate_presence_of(:card_code) }
  it { is_expected.to validate_presence_of(:card_name) }
end
