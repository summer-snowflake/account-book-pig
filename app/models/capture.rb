# frozen_string_literal: true
class Capture < ApplicationRecord
  belongs_to :user

  attr_accessor :validate_check

  with_options if: :validate_check do |cap|
    cap.validates :published_at, presence: true
    cap.validates :category_name, length: { maximum: Settings.category.name.maximum_length }
    cap.validates :breakdown_name, length: { maximum: Settings.breakdown.name.maximum_length }
    cap.validates :place_name, length: { maximum: Settings.place.name.maximum_length }
    cap.validates :charge,
                  numericality: { only_integer: true,
                                  greater_than_or_equal_to: 0,
                                  less_than_or_equal_to: 9_999_999,
                                  allow_blank: true }
    cap.validates :memo, length: { maximum: Settings.record.memo.maximum_length }
  end
end
