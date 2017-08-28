# frozen_string_literal: true

require 'net/http'

class AllDoneTask::Fetcher
  include ActiveModel::Model

  def initialize(task_params)
    @list_id = task_params['list_id']
    url = ENV['TRELLO_URL']
    key = ENV['TRELLO_API_KEY']
    token = ENV['TRELLO_API_TOKEN']
    cards_uri = "/lists/#{@list_id}/cards?fields=name&key=#{key}&token=#{token}"
    res = Net::HTTP.get(URI.parse(url + cards_uri))
    @cards = JSON.parse(res)
  end

  def save_all
    AllDoneTask.transaction do
      AllDoneTask.recreate_all!(@list_id, @cards)
    end
    true
  rescue => ex
    errors[:base] << ex.message
    false
  end
end
