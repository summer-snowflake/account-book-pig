# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:tagged_records) }
  it { is_expected.to have_many(:records).through(:tagged_records) }

  describe 'バリデーション' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id) }
    it { is_expected.to validate_uniqueness_of(:color_code).scoped_to(:user_id) }
  end

  describe '#set_color_code' do
    subject { build(:tag, color_code: nil) }

    it '保存時にカラーコードが設定されること' do
      subject.save!
      expect(subject.color_code).to be_a String
      expect(subject.color_code).to match /\A\#\w{6}\Z/
    end
  end
end
