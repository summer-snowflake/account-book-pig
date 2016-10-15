json.access_token @session.token.token

json.user do
  json.id @user.id
  json.type @user.type
  json.email @user.email
  json.new_email @user.new_email
  json.nickname @user.nickname
  json.user_name @user.screen_name
  json.currency @user.currency
  json.admin @user.admin

  if @user.try(:auth)
    json.auth do
      json.name @user.auth.try(:name)
      json.screen_name @user.auth.try(:screen_name)
    end
  end
end
