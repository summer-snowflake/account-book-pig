# frozen_string_literal: true

class FacebookUserDecorator < UserDecorator
  delegate_all

  def screen_name
    nickname.present? ? nickname : auth.name
  end
end
