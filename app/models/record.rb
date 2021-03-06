# frozen_string_literal: true

class Record < ActiveRecord::Base
  counter_culture :category

  belongs_to :user
  belongs_to :category
  belongs_to :breakdown
  belongs_to :place
  has_many :tagged_records
  has_many :tags, through: :tagged_records

  validates :published_on, presence: true
  validates :user_id, presence: true
  validates :charge, presence: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 9_999_999,
                                     allow_blank: true }
  validates :category, presence: true
  validates :memo, length: { maximum: Settings.record.memo.maximum_length }
  validate :should_be_less_than_maximum, on: :create

  scope :the_day, ->(target_day) { where(published_on: target_day.to_date) }
  scope :the_month, lambda { |first_day|
    where(published_on: first_day..first_day.end_of_month)
  }
  scope :the_year, lambda { |first_day|
    where(published_on: first_day..first_day.end_of_year)
  }

  def update_with_tags(record_params, tags_params)
    if update(record_params)
      tags_params.present? ? create_or_update_tags(tags_params) : true
    else
      false
    end
  end

  def create_or_update_tags(tags_params)
    return true if tags_params.blank?
    tag_ids = create_and_update_tags(tags_params)
    create_tagged(tag_ids)
  end

  def create_and_update_tags(tags_params)
    tag_ids = tags_params.map { |n| n['id'].nil? ? nil : n['id'] }.compact
    registered_tags = tags_params.reject { |n| n['id'].nil? }
    user.tags.update(tag_ids, registered_tags) if registered_tags.present?

    unregistered_tags = tags_params.select { |n| n['id'].nil? }
    tag_ids.concat(create_tags(unregistered_tags))
  end

  def create_tags(unregistered_tags)
    user.tags.create(unregistered_tags).map(&:id)
  end

  def create_tagged(tag_ids)
    tagged = []
    tag_ids.each do |tag_id|
      tagged << TaggedRecord.new(record_id: id, tag_id: tag_id)
    end
    tagged_records.destroy_all ? TaggedRecord.import(tagged) : false
  end

  private

  def should_be_less_than_maximum
    maximum_count = if user.admin
                      Settings.record.max_count_of_admin
                    else
                      Settings.record.max_count
                    end
    if maximum_count <= user.records.count
      errors[:base] <<
        I18n.t('errors.messages.records.too_many', count: maximum_count)
    end
    true
  end
end
