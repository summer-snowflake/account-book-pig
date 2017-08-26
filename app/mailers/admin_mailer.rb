# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  # フィードバックのお知らせ
  def notice_feedback(feedback)
    @feedback = feedback
    @user = @feedback.user.decorate if @feedback.user
    mail to: Settings.mail_from
  end
end
