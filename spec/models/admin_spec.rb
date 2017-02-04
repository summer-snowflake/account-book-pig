# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { is_expected.to belong_to(:user) }

  describe 'バリデーション' do
    let(:user) { create(:user) }
    subject { create(:admin, user: user) }

    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_uniqueness_of(:user_id) }
  end
end
