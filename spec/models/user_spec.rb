# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:feedbacks) }
  it { is_expected.to have_many(:categories) }
  it { is_expected.to have_many(:places) }
  it { is_expected.to have_many(:messages) }
  it { is_expected.to have_many(:records) }
  it { is_expected.to have_many(:tags) }
  it { is_expected.to have_many(:tallies) }
  it { is_expected.to have_many(:captures) }
  it { is_expected.to have_one(:admin) }

  describe 'バリデーション' do
    it { is_expected.to validate_length_of(:nickname).is_at_most(100) }
  end

  shared_examples_for '#authorize_new_email' do
    let(:new_email) { 'new_email@example.com' }

    it 'update email' do
      expect(user.new_email).to eq new_email
      user.authorize_new_email
      expect(user.email).to eq new_email
      expect(user.new_email).to eq ''
    end
  end

  context 'email user' do
    let!(:user) { create(:email_user, :registered, new_email: new_email) }

    it_behaves_like '#authorize_new_email'
  end

  context 'twitter user' do
    let!(:user) { create(:twitter_user, :registered, new_email: new_email) }

    it_behaves_like '#authorize_new_email'
  end
end
