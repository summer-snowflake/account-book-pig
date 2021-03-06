# frozen_string_literal: true

require 'rails_helper'

describe 'GET /mypage', autodoc: true do
  context 'ログインしていない場合' do
    it '401が返ってくること' do
      get '/user'
      expect(response.status).to eq 401
    end
  end

  context 'ユーザーにお知らせとメッセージがある場合' do
    let!(:user) { create(:email_user, :registered).decorate }
    let!(:user2) { create(:email_user, :registered) }
    let!(:notice1) { create(:notice, post_at: Time.zone.today) }
    let!(:notice2) { create(:notice, post_at: Time.zone.yesterday) }
    let!(:notice3) { create(:notice, post_at: Time.zone.tomorrow) }
    let!(:message1) { create(:message, user: user, read: true) }
    let!(:message2) { create(:message, user: user2) }
    let!(:message3) { create(:message, user: user) }
    let!(:record1) { create(:record, user: user) }
    let!(:record2) { create(:record, user: user) }
    let!(:record3) do
      create(:record, user: user, published_on: 1.month.ago)
    end

    it '200とお知らせ情報、メッセージ情報を返すこと' do
      get '/mypage', params: '', headers: login_headers(user)
      expect(response.status).to eq 200

      json = {
        notices: [
          {
            id: notice1.id,
            title: notice1.title,
            content: notice1.content,
            post_at: notice1.post_at.strftime('%Y-%m-%d')
          },
          {
            id: notice2.id,
            title: notice2.title,
            content: notice2.content,
            post_at: notice2.post_at.strftime('%Y-%m-%d')
          }
        ],
        messages: [
          {
            id: message3.id,
            content: message3.content,
            read: false,
            created_at: I18n.l(message3.created_at)
          },
          {
            id: message1.id,
            content: message1.content,
            read: true,
            created_at: I18n.l(message1.created_at)
          }
        ],
        records: [
          {
            id: record3.id,
            published_on: record3.published_on.strftime('%Y-%m-%d'),
            payments: record3.category.barance_of_payments,
            charge: record3.charge,
            category_name: record3.category.name,
            breakdown_name: record3.breakdown.try(:name),
            place_name: record3.place.try(:name),
            memo: record3.memo
          },
          {
            id: record2.id,
            published_on: record2.published_on.strftime('%Y-%m-%d'),
            payments: record2.category.barance_of_payments,
            charge: record2.charge,
            category_name: record2.category.name,
            breakdown_name: record2.breakdown.try(:name),
            place_name: record2.place.try(:name),
            memo: record2.memo
          },
          {
            id: record1.id,
            published_on: record1.published_on.strftime('%Y-%m-%d'),
            payments: record1.category.barance_of_payments,
            charge: record1.charge,
            category_name: record1.category.name,
            breakdown_name: record1.breakdown.try(:name),
            place_name: record1.place.try(:name),
            memo: record1.memo
          }
        ],
        user: {
          currency: user.currency,
          current_record_count: user.records.count,
          max_record_count: user.max_record_count
        }
      }
      expect(response.body).to be_json_as(json)
    end
  end
end

describe 'GET /notices', autodoc: true do
  context 'ログインしていない場合' do
    it '401が返ってくること' do
      get '/user'
      expect(response.status).to eq 401
    end
  end

  context 'ユーザーにお知らせがある場合' do
    let!(:user) { create(:email_user, :registered) }
    let!(:notice1) { create(:notice, post_at: Time.zone.today) }
    let!(:notice2) { create(:notice, post_at: Time.zone.yesterday) }
    let!(:notice3) { create(:notice, post_at: Time.zone.tomorrow) }

    it '200とお知らせ情報を返すこと' do
      get '/notices', params: '', headers: login_headers(user)
      expect(response.status).to eq 200

      json = {
        notices: [
          {
            id: notice1.id,
            title: notice1.title,
            content: notice1.content,
            post_at: notice1.post_at.strftime('%Y-%m-%d')
          },
          {
            id: notice2.id,
            title: notice2.title,
            content: notice2.content,
            post_at: notice2.post_at.strftime('%Y-%m-%d')
          }
        ]
      }
      expect(response.body).to be_json_as(json)
    end
  end
end

describe 'GET /messages', autodoc: true do
  context 'ログインしていない場合' do
    it '401が返ってくること' do
      get '/user'
      expect(response.status).to eq 401
    end
  end

  context 'ユーザーにメッセージがある場合' do
    let!(:user) { create(:email_user, :registered) }
    let!(:user2) { create(:email_user, :registered) }
    let!(:message1) { create(:message, user: user, read: true) }
    let!(:message2) { create(:message, user: user2) }
    let!(:message3) { create(:message, user: user) }

    it '200とメッセージ情報を返すこと' do
      get '/messages', params: '', headers: login_headers(user)
      expect(response.status).to eq 200

      json = {
        messages: [
          {
            id: message3.id,
            content: message3.content,
            read: false,
            created_at: I18n.l(message3.created_at)
          },
          {
            id: message1.id,
            content: message1.content,
            read: true,
            created_at: I18n.l(message1.created_at)
          }
        ]
      }
      expect(response.body).to be_json_as(json)
    end
  end
end
