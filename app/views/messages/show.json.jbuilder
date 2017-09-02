# frozen_string_literal: true

json.id @message.id
json.content @message.content
json.created_at I18n.l(@message.created_at)
