# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Record, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:category) }
  it { is_expected.to belong_to(:breakdown) }
  it { is_expected.to belong_to(:place) }
  it { is_expected.to have_many(:tagged_records) }
  it { is_expected.to have_many(:tags).through(:tagged_records) }

  describe 'validation' do
    subject { create(:record, user: create(:email_user, :registered)) }

    it { is_expected.to validate_presence_of(:published_at) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:charge) }
    it { is_expected.to validate_numericality_of(:charge).only_integer }
    it { is_expected.to validate_length_of(:memo).is_at_most(10_000) }
  end
end
