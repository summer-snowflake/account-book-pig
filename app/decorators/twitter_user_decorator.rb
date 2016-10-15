# frozen_string_literal: true
class TwitterUserDecorator < Draper::Decorator
  delegate_all

  def screen_name
    nickname.present? ? nickname : auth.name
  end
end
