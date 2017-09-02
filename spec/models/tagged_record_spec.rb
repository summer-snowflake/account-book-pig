# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaggedRecord, type: :model do
  it { is_expected.to belong_to(:record) }
  it { is_expected.to belong_to(:tag) }

  describe 'バリデーション' do
    let(:record) { create(:record) }
    let(:tag) { create(:tag) }

    subject { create(:tagged_record, record: record, tag: tag) }

    it { is_expected.to validate_presence_of(:record_id) }
    it { is_expected.to validate_presence_of(:tag_id) }
    it do
      is_expected.to validate_uniqueness_of(:record_id).scoped_to(:tag_id)
    end
  end
end
