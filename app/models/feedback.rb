# frozen_string_literal: true

class Feedback < ActiveRecord::Base
  belongs_to :user
  has_many :messages

  validates :content,
            presence: true,
            length: { maximum: Settings.feedback.content.maximum_length }
  validates :email,
            presence: true,
            email_format: { allow_blank: true },
            length: { maximum: Settings.feedback.email.maximum_length },
            unless: ->(obj) { obj.email.nil? }

  def notice_to_slack
    Slack.chat_postMessage(
      text: "```#{content}```",
      username: "#{user.try(:id)}. #{user.try(:screen_name)}#{email}",
      channel: '#feedbacks'
    )
  end
end
