# frozen_string_literal: true
class AdminUser < User
  def maximum_values
    {
      category: Settings.category.maximum_admin_size,
      breakdown: Settings.category.breakdowns.admin_maximum_length,
      place: Settings.user.places.admin_maximum_length,
      record: Settings.user.records.admin_maximum_length
    }
  end
end
