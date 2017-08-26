# frozen_string_literal: true

namespace :user do
  desc 'Add administrator authority to user.'
  task set_admin: :environment do
    begin
      id = ENV['USER_ID']
      raise "ENV['USER_ID'] is not found." unless id
      user = User.find(id)
      user.create_admin!
    rescue => ex
      puts ex.message
    end
  end
end
