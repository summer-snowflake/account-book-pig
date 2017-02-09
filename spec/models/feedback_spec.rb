# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:messages) }

  describe 'バリデーション' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_most(10_000) }
    it { is_expected.to validate_length_of(:email).is_at_most(100) }

    context 'when email is null' do
      before { allow(subject).to receive(:email).and_return(nil) }
      it { is_expected.not_to validate_presence_of(:email) }
    end

    context 'when email is blank' do
      before { allow(subject).to receive(:email).and_return('') }
      it { is_expected.to validate_presence_of(:email) }
    end
  end
end
