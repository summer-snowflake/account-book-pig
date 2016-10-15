json.feedbacks do
  json.array! @feedbacks do |feedback|
    user = feedback.user.decorate if feedback.user
    json.id feedback.id
    json.checked feedback.checked
    json.email feedback.email
    json.user_id user.try(:id)
    json.user_name user.try(:screen_name)
    json.content simple_format(feedback.content)
    json.created_at I18n.l(feedback.created_at)
  end
end

json.total_count @total_count
