# frozen_string_literal: true
class FacebookUserDecorator < Draper::Decorator
  delegate_all

  def screen_name
    nickname || auth.try(:name) || auth.try(:screen_name)
  end
end
