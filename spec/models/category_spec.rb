# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:email_user, :registered) }
  let!(:category) { create(:category, user: user, barance_of_payments: true) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:breakdowns) }
  it { is_expected.to have_many(:categorize_places) }
  it { is_expected.to have_many(:places).through(:categorize_places) }
  it { is_expected.to have_many(:records) }
  it { is_expected.to have_many(:captures) }

  describe 'validation' do
    subject { category }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }
  end

  describe '#should_not_have_contents' do
    context 'have records' do
      let!(:record) { create(:record, category: category) }

      it 'occures an error' do
        category.destroy
        expect(category.destroyed?).to be_falsey
        expect(category.errors.full_messages).to eq ['登録した収支を削除してから削除してください']
      end
    end

    context 'have no record' do
      it 'destroyed' do
        category.destroy
        expect(category.destroyed?).to be_truthy
      end
    end
  end
end
