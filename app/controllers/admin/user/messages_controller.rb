# frozen_string_literal: true

class Admin::User::MessagesController < ApplicationController
  before_action :authenticate
  before_action :admin_authenticate

  def create
    user = User.find(params[:user_id])
    @message = user.messages.new(message_params.merge(sent_at: Time.zone.now))
    if @message.save
      head 201
    else
      render_error @message
    end
  end

  private

  def message_params
    params.permit(:content, :feedback_id)
  end
end
