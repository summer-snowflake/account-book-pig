# frozen_string_literal: true

json.categories do
  json.array! @categories do |category|
    json.id category.id
    json.name category.name
    json.barance_of_payments category.barance_of_payments
    json.selected_place category.selected_place?(@place.id)
  end
end
