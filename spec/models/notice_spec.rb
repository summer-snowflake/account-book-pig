# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notice, type: :model do
  describe 'バリデーション' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(100) }
    it { is_expected.to validate_length_of(:content).is_at_most(10_000) }
  end

  describe '#published' do
    let!(:publish_notice) { create(:notice, post_at: Time.zone.today) }
    let!(:unpublish_notice) { create(:notice, post_at: Time.zone.tomorrow) }
    subject { Notice.all.published }

    it '公開日が今日より前の投稿のみ取得できる' do
      expect(subject).to eq [publish_notice]
    end
  end
end
