# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { is_expected.to belong_to(:user) }

  describe 'バリデーション' do
    subject { create(:admin, user: create(:email_user, :registered)) }

    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_uniqueness_of(:user_id) }
  end
end
