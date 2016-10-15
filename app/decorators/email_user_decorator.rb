# frozen_string_literal: true
class EmailUserDecorator < Draper::Decorator
  delegate_all

  def screen_name
    nickname || email
  end
end
