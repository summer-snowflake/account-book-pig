# frozen_string_literal: true
class UserDecorator < Draper::Decorator
  delegate_all

  def screen_name
    becomes(type.classify.constantize).decorate.screen_name
  end
end
