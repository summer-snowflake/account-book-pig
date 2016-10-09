# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'validation' do
    subject { create(:place, user: create(:email_user, :registered)) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:categorize_places) }
    it { is_expected.to have_many(:categories).through(:categorize_places) }
    it { is_expected.to have_many(:records) }
    it { is_expected.to have_many(:captures) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }
  end
end
