# frozen_string_literal: true
class User::EmailUpdator
  attr_accessor :user

  def initialize(params)
    @user = User.find(params[:user_id])
    @token = params[:token]
  end

  def authorize
    token_user = User.find_by_valid_token(:new_email, @token)
    if token_user == @user
      @user.authorize_new_email && @user.remove_token(:new_email)
    else
      @user.errors[:base] << I18n.t('errors.messages.users.invalid_token')
      false
    end
  end
end
