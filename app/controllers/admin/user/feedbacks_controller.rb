# frozen_string_literal: true

class Admin::User::FeedbacksController < ApplicationController
  before_action :authenticate
  before_action :admin_authenticate

  def index
    @user = User.find(params[:user_id]).decorate
    @feedbacks = @user.feedbacks
  end
end
