# frozen_string_literal: true

class ActionMailer::MessageDelivery
  def deliver_later
    deliver_now
  end
end
