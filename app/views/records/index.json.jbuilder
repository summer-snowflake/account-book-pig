# frozen_string_literal: true

json.records do
  json.array! @records do |record|
    json.id record.id
    json.published_on record.published_on
    json.payments record.category.barance_of_payments
    json.charge record.charge
    json.category_id record.category.id
    json.category_name record.category.name
    json.breakdown_id record.breakdown_id
    json.breakdown_name record.breakdown.try(:name)
    json.place_id record.place_id
    json.place_name record.place.try(:name)
    json.memo record.memo
    json.tags record.tags do |tag|
      json.id tag.id
      json.name tag.name
      json.color_code tag.color_code
    end
  end
end

json.total_count @total_count

json.user do
  json.currency @user.currency
end

json.category_name @category_name
json.breakdown_name @breakdown_name
json.place_name @place_name
