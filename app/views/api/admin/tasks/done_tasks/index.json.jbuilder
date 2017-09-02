# frozen_string_literal: true

json.tasks do
  json.array! @tasks do |task|
    json.card_name task.card_name
  end
end
