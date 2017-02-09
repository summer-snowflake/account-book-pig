# frozen_string_literal: true
class TaggedRecord < ActiveRecord::Base
  belongs_to :tag
  belongs_to :record

  validates :tag_id, presence: true
  validates :record_id, presence: true
  validates :record_id, uniqueness: { scope: :tag_id }
end
