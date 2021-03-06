# frozen_string_literal: true

require 'rails_helper'

describe 'GET /tags', autodoc: true do
  context 'ログインしていない場合' do
    it '401が返ってくること' do
      get '/tags'
      expect(response.status).to eq 401
    end
  end

  context 'メールアドレスのユーザーがログインしている場合' do
    let!(:user) { create(:email_user, :registered) }
    let!(:tag1) { create(:tag, user: user) }
    let!(:tag2) { create(:tag, user: user) }

    it '200とラベル一覧を返すこと' do
      get '/tags', params: '', headers: login_headers(user)
      expect(response.status).to eq 200

      json = {
        tags: [
          {
            id: tag1.id,
            color_code: tag1.color_code,
            name: tag1.name
          },
          {
            id: tag2.id,
            color_code: tag2.color_code,
            name: tag2.name
          }
        ]
      }
      expect(response.body).to be_json_as(json)
    end
  end
end
