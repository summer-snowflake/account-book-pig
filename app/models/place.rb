# frozen_string_literal: true
class Place < ActiveRecord::Base
  belongs_to :user
  has_many :categorize_places, dependent: :destroy
  has_many :categories, through: :categorize_places
  has_many :records
  has_many :captures

  validates :name,
            presence: true,
            length: { maximum: Settings.place.name.maximum_length }
  validate :should_be_less_than_maximum, on: :create

  def categorize?(category_id)
    categories.map(&:id).include?(category_id)
  end

  private

  def should_be_less_than_maximum
    maximum_count = if user.admin
                      Settings.user.places.admin_maximum_length
                    else
                      Settings.user.places.maximum_length
                    end
    if maximum_count <= user.places.count
      errors[:base] << I18n.t('errors.messages.places.too_many', count: maximum_count)
    end
  end
end
