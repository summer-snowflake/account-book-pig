# frozen_string_literal: true

json.notices do
  json.array! @notices do |notice|
    json.id notice.id
    json.title notice.title
    json.content notice.content
    json.post_at notice.post_at
  end
end
