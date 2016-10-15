# frozen_string_literal: true
class EmailUserDecorator < Draper::Decorator
  delegate_all

  def screen_name
    nickname.present? ? nickname : email
  end
end
