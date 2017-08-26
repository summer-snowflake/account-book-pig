# frozen_string_literal: true

class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :feedback

  validates :content,
            presence: true,
            length: { maximum: Settings.message.content.maximum_length }
  validates :user, presence: true

  def to_read
    update(read: true)
  end

  def send_mail(origin)
    if user.email.present?
      UserMailer.confirm_message(user.email, origin).deliver_later
      update(sent_at: Time.zone.now)
    else
      errors[:base] << I18n.t('errors.messages.messages.not_found_email')
      false
    end
  end
end
