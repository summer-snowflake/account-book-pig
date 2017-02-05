# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Auth, type: :model do
  it { is_expected.to belong_to(:twitter_user) }
  it { is_expected.to belong_to(:facebook_user) }

  describe 'バリデーション' do
    let(:user) { create(:twitter_user, :registered) }
    subject { create(:auth, provider: 'twitter', user_id: user.id) }

    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:provider) }

    it do
      is_expected.to validate_inclusion_of(:provider)
        .in_array(%w(twitter facebook))
    end
  end
end
