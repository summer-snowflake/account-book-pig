# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Breakdown, type: :model do
  it { is_expected.to belong_to(:category) }
  it { is_expected.to have_many(:records) }
  it { is_expected.to have_many(:captures) }

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:category_id) }
  end
end
