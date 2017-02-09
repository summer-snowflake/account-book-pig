# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Tally, type: :model do
  it { is_expected.to belong_to(:user) }

  describe 'validation' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:year) }
  end
end
