json.feedbacks do
  json.array! @feedbacks do |feedback|
    json.id feedback.id
    json.checked feedback.checked
    json.email feedback.email
    json.content simple_format(feedback.content)
    json.created_at I18n.l(feedback.created_at)
    json.user do
      user = feedback.user.decorate if feedback.user
      json.id user.try(:id)
      json.screen_name user.try(:screen_name)
      json.email user.try(:email)
    end
  end
end

json.total_count @total_count
