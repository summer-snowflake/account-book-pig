# frozen_string_literal: true

class TwitterUser < User
  has_one :auth, foreign_key: 'user_id'

  def self.create_with(auth)
    twitter_user = new(status: :inactive)
    twitter_user.auth = Auth.new(
      provider: 'twitter',
      uid: auth['uid'],
      screen_name: auth['info']['nickname'],
      name: auth['info']['name']
    )
    twitter_user.save!
    twitter_user
  end
end
