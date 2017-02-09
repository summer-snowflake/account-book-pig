json.messages do
  json.array! @messages do |message|
    user = message.user.decorate if message.user
    json.id message.id
    json.read message.read
    json.sent_at message.sent_at ? I18n.l(message.sent_at) : ''
    json.user_name user.try(:screen_name)
    json.user_email user.try(:email)
    json.feedback_content message.feedback.try(:content)
    json.content message.content
    json.created_at I18n.l(message.created_at)
  end
end

json.total_count @total_count
