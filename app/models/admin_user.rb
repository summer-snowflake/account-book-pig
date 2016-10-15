# frozen_string_literal: true
class AdminUser < User
  def maximum_values
    {
      category: Settings.category.max_count_of_admin,
      breakdown: Settings.category.breakdowns.admin_maximum_length,
      place: Settings.user.places.admin_maximum_length,
      record: Settings.user.records.admin_maximum_length
    }
  end
end
