# frozen_string_literal: true

class EmailUserDecorator < UserDecorator
  delegate_all

  def screen_name
    nickname.present? ? nickname : email
  end
end
