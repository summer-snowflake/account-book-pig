# frozen_string_literal: true

require 'csv'

CSV.generate do |csv|
  @records.each do |record|
    csv << [
      record.published_on,
      record.category.try!(:name),
      record.breakdown.try!(:name),
      record.place.try!(:name),
      record.charge,
      record.memo,
      record.tags.pluck(:name).join(',')
    ]
  end
end
