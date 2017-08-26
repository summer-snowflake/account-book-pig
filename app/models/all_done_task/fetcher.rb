# frozen_string_literal: true

require 'net/http'

class AllDoneTask::Fetcher
  include ActiveModel::Model

  def initialize
    url = ENV['TRELLO_URL']
    list_id = ENV['TRELLO_DONE_LIST_ID']
    key = ENV['TRELLO_API_KEY']
    token = ENV['TRELLO_API_TOKEN']
    get_cards_uri = '/lists/' + list_id + '/cards?fields=name&key=' + key + '&token=' + token
    res = Net::HTTP.get(URI.parse(url + get_cards_uri))
    @cards = JSON.parse(res)
  end

  def save_all
    AllDoneTask.transaction do
      @cards.each do |card|
        AllDoneTask.create!(confirmed_on: Time.zone.today, card_code: card['id'], card_name: card['name'])
      end
    end
    return true
    rescue => ex
      errors[:base] << ex.message
      return false
  end
end
