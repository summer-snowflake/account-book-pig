# frozen_string_literal: true
class Category < ActiveRecord::Base
  belongs_to :user
  has_many :breakdowns
  has_many :categorize_places, dependent: :destroy
  has_many :places, through: :categorize_places
  has_many :records
  has_many :captures

  validates :name,
            presence: true,
            length: { maximum: Settings.category.name.maximum_length }
  validates :breakdowns,
            length: { maximum: Settings.category.breakdowns.maximum_length,
                      too_long: I18n.t('errors.messages.too_many') }
  validate :should_be_less_than_maximum, on: :create

  before_create :set_position
  before_destroy :should_not_have_contents

  # callback: before_create
  def set_position
    self.position = user.categories.count
    # FIXME: 削除すると並び順が変わる可能性がある
  end

  # callback: before_destroy
  def should_not_have_contents
    if breakdowns.any?
      errors[:base] << I18n.t('errors.messages.categories.destroy_breakdowns')
      throw :abort
    end
    if records.any?
      errors[:base] << I18n.t('errors.messages.categories.destroy_records')
      throw :abort
    end
  end

  def selected_place?(place_id)
    places.map(&:id).include?(place_id)
  end

  def _payments_name
    if barance_of_payments
      I18n.t('labels.barance_of_payments.income')
    else
      I18n.t('labels.barance_of_payments.outgo')
    end
  end

  private

  # validate
  def should_be_less_than_maximum
    maximum_count = if user.admin
                      Settings.category.max_count_of_admin
                    else
                      Settings.category.max_count
                    end
    if maximum_count <= user.categories.count
      errors[:base] <<
        I18n.t('errors.messages.categories.too_many', count: maximum_count)
    end
  end
end
