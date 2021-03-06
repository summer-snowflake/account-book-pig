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

  def human_type_name
    I18n.t("labels.type.#{type.underscore}")
  end

  def type_label_name
    TYPE_LABEL_NAME[type.to_sym]
  end

  def last_login_time
    I18n.l(last_sign_in_at) if last_sign_in_at
  end

  def human_status_name
    I18n.t("labels.status.#{status}")
  end

  def status_label_name
    STATUS_LABEL_NAME[status.to_sym]
  end

  def max_category_count
    admin? ? Settings.category.max_count_of_admin : Settings.category.max_count
  end

  def max_place_count
    admin? ? Settings.place.max_count_of_admin : Settings.place.max_count
  end

  def max_record_count
    admin? ? Settings.record.max_count_of_admin : Settings.record.max_count
  end

  def current_record_count
    records.count
  end
end
