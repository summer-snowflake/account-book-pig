# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CategorizePlace, type: :model do
  it { is_expected.to belong_to(:category) }
  it { is_expected.to belong_to(:place) }

  describe 'バリデーション' do
    let(:category) { create(:category) }
    let(:place) { create(:place) }
    subject { create(:categorize_place, category: category, place: place) }

    it { is_expected.to validate_presence_of(:category_id) }
    it { is_expected.to validate_presence_of(:place_id) }
    it do
      is_expected.to validate_uniqueness_of(:category_id).scoped_to(:place_id)
    end
  end
end
