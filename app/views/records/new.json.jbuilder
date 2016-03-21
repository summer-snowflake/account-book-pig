json.categories do
  json.array! @categories do |category|
    json.id category.id
    json.name category.name
    json.barance_of_payments category.barance_of_payments
    json.breakdowns do
      json.array! category.breakdowns do |breakdown|
        json.id breakdown.id
        json.name breakdown.name
      end
    end
    json.places do
      json.array! category.places do |place|
        json.id place.id
        json.name place.name
      end
    end
  end
end

json.user do
  json.breakdown_field @user.breakdown_field
  json.place_field @user.place_field
  json.memo_field @user.memo_field
end