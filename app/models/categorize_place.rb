# frozen_string_literal: true

class CategorizePlace < ActiveRecord::Base
  counter_culture :category, column_name: 'places_count'
  belongs_to :category
  belongs_to :place

  validates :category_id, presence: true
  validates :place_id, presence: true
  validates :category_id, uniqueness: { scope: :place_id }
  # validates :place, uniqueness: { scope: :category_id }
end
