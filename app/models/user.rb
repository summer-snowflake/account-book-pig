# frozen_string_literal: true
class User < ActiveRecord::Base
  tokenizable
  has_many :feedbacks
  has_many :categories
  has_many :places
  has_many :messages
  has_many :records
  has_many :tags
  has_many :tallies
  has_many :captures
  has_many :breakdowns, through: :categories

  enum status: { inactive: 1, registered: 2 }

  validates :nickname,
            length: { maximum: Settings.user.nickname.maximum_length }
  # TODO: ユーザーのランクによって制限数を変更する

  before_create :set_currency

  def active?
    registered? # TODO: 有効期限を確認する
  end

  def self.find_or_create(auth)
    klass = (auth['provider'].capitalize + 'User').constantize
    Auth.find_by_uid(auth['uid']).try(auth['provider'] + '_user') ||
      klass.create_with(auth)
  end

  def each_maximum_values
    user = admin? ? becomes(AdminUser) : self
    user.maximum_values
  end

  def maximum_values
    { category: Settings.category.max_count,
      breakdown: Settings.breakdown.max_count,
      place: Settings.place.max_count,
      record: Settings.record.max_count }
  end

  def add_access_token
    add_token(
      :access, size: Settings.access_token.length,
               expires_at: Settings.access_token.expire_after.seconds.from_now
    )
  end

  def add_new_email_token
    add_token(
      :new_email,
      size: Settings.password_token.length,
      expires_at: Settings.new_email_token.expire_after.seconds.from_now
    )
  end

  def new_email_token
    @new_email_token ||= add_new_email_token
  end

  def new_email_url(origin)
    token = new_email_token.token
    "#{origin}/user/authorize_email?user_id=#{id}&token=#{token}"
  end

  def authorize_new_email
    update(email: new_email, new_email: '')
  end

  private

  def set_currency
    self.currency = '¥' # TODO: ロケールによりデフォルトを変更する
  end
end
