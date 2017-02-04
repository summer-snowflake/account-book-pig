# frozen_string_literal: true
class Place < ActiveRecord::Base
  belongs_to :user
  has_many :categorize_places, dependent: :destroy
  has_many :categories, through: :categorize_places
  has_many :records
  has_many :captures

  validates :user_id, presence: true
  validates :name,
            presence: true,
            uniqueness: { scope: :user_id, case_sensitive: true },
            length: { maximum: Settings.place.name.maximum_length }
  before_create :should_be_less_than_maximum

  def categorize?(category_id)
    categories.map(&:id).include?(category_id)
  end

  private

  def should_be_less_than_maximum
    maximum_count = if user.admin
                      Settings.place.max_count_of_admin
                    else
                      Settings.place.max_count
                    end
    if maximum_count <= user.places.count
      errors[:base] <<
        I18n.t('errors.messages.places.too_many', count: maximum_count)
      throw :abort
    end
  end
end
