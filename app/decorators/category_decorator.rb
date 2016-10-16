# frozen_string_literal: true
class CategoryDecorator < Draper::Decorator
  delegate_all

  def human_payments_name
    if barance_of_payments
      I18n.t('labels.barance_of_payments.income')
    else
      I18n.t('labels.barance_of_payments.outgo')
    end
  end
end
