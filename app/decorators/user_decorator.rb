# frozen_string_literal: true
class UserDecorator < Draper::Decorator
  delegate_all

  TYPE_LABEL_NAME = {
    EmailUser: 'label-warning',
    TwitterUser: 'label-info',
    FacebookUser: 'label-primary'
  }.freeze
  STATUS_LABEL_NAME = {
    inactive: 'label-default',
    registered: 'label-success'
  }.freeze

  def screen_name
    becomes(type.classify.constantize).decorate.screen_name
  end

  def type_label_name
    TYPE_LABEL_NAME[type.to_sym]
  end

  def status_label_name
    STATUS_LABEL_NAME[status.to_sym]
  end
end
