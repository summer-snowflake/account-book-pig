# frozen_string_literal: true
class AdminUser < User
  def maximum_values
    {
      category: Settings.category.max_count_of_admin,
      breakdown: Settings.category.breakdowns.admin_maximum_length,
      place: Settings.place.max_count_of_admin,
      record: Settings.record.max_count_of_admin
    }
  end
end
