# frozen_string_literal: true

class Admin::MessagesController < ApplicationController
  before_action :authenticate
  before_action :admin_authenticate

  def index
    @messages = Message::Fetcher.all(params: params)
    @total_count = Message.count
  end

  def update
    message = Message.find(params[:id])
    if message.update(content: params[:content])
      head 200
    else
      render_error message
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    head message.destroyed? ? :ok : :forbidden
  end

  def send_mail
    message = Message.find(params[:message_id])
    origin = "#{request.protocol}#{request.host_with_port}"

    if message.send_mail(origin)
      head :ok
    else
      render_error message
    end
  end
end
