# frozen_string_literal: true

json.captures do
  json.array! @captures do |capture|
    json.id capture.id
    json.created_at I18n.l(capture.created_at)
    json.published_on capture.published_on
    json.category_name capture.category_name
    json.category_payments capture.category.try(:barance_of_payments)
    json.category_id capture.category_id
    json.breakdown_name capture.breakdown_name
    json.breakdown_id capture.breakdown_id
    json.place_name capture.place_name
    json.place_id capture.place_id
    json.charge capture.charge
    json.memo capture.memo
    json.tags capture.tags
    json.comment capture.comment
  end
end

json.user_currency @user.currency
