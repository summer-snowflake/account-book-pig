# frozen_string_literal: true

class TwitterUserDecorator < UserDecorator
  delegate_all

  def screen_name
    nickname.present? ? nickname : auth.name
  end
end
