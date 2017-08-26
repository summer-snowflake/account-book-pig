# frozen_string_literal: true

json.id @user.id
json.admin @user.admin?
json.type_label_name @user.type_label_name
json.type @user.human_type_name
json.status_label_name @user.status_label_name
json.status @user.human_status_name
json.nickname @user.nickname
json.email @user.email
json.last_sign_in_at @user.last_login_time
