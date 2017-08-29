# frozen_string_literal: true

require 'net/http'

class AllDoneTask::Fetcher
  include ActiveModel::Model

  def initialize(task_params)
    @board_code = task_params['board_id']
    @list_code = task_params['list_id']
    @url = ENV['TRELLO_URL']
    @key = ENV['TRELLO_API_KEY']
    @token = ENV['TRELLO_API_TOKEN']
    @user_code = ENV['TRELLO_USER_ID']
    @board_name = get_board_name
    @cards = get_cards
  end

  def save_all
    AllDoneTask.transaction do
      AllDoneTask.recreate_all!(@board_name, @list_code, @cards)
    end
    true
  rescue => ex
    errors[:base] << ex.message
    false
  end

  private

  def get_board_name
    parameters = "fields=name&key=#{@key}&token=#{@token}"
    boards_uri = "/members/#{@user_code}/boards?#{parameters}"
    res = Net::HTTP.get(URI.parse(@url + boards_uri))
    boards = JSON.parse(res)
    board = boards.find { |b| b['id'] == @board_code }
    board['name']
  end

  def get_cards
    parameters = "fields=name&key=#{@key}&token=#{@token}"
    cards_uri = "/lists/#{@list_code}/cards?#{parameters}"
    res = Net::HTTP.get(URI.parse(@url + cards_uri))
    JSON.parse(res)
  end
end
