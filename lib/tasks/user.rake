# frozen_string_literal: true

namespace :user do
  desc 'Add administrator authority to user.'
  task set_admin: :environment do
    id = ENV['USER_ID']
    raise "ENV['USER_ID'] is not found." unless id
    user = User.find(id)
    user.create_admin!
  end
end
