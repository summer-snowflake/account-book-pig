# frozen_string_literal: true

require 'rails_helper'

describe 'GET /admin/notices?offset=offset', autodoc: true do
  let!(:user) { create(:email_user, :registered) }
  let!(:admin_user) { create(:email_user, :admin_user, :registered) }
  let!(:notice1) { create(:notice, post_at: Time.zone.yesterday) }
  let!(:notice2) { create(:notice) }

  context 'ログインしていない場合' do
    it '401が返ってくること' do
      get '/admin/notices/', params: ''

      expect(response.status).to eq 401
    end
  end

  context '一般ユーザーとしてログインしている場合' do
    it '401が返ってくること' do
      get '/admin/notices/', params: '', headers: login_headers(user)

      expect(response.status).to eq 401
    end
  end

  context '管理ユーザーとしてログインしている場合' do
    context '1ページ以内のお知らせ数の場合' do
      it '200が返り、お知らせ一覧が返ってくること' do
        get '/admin/notices/', params: '', headers: login_headers(admin_user)

        expect(response.status).to eq 200
        json = {
          notices: [
            {
              id: notice2.id,
              title: notice2.title,
              content: notice2.content,
              post_at: notice2.post_at.strftime('%Y-%m-%d')
            },
            {
              id: notice1.id,
              title: notice1.title,
              content: notice1.content,
              post_at: notice1.post_at.strftime('%Y-%m-%d')
            }
          ],
          total_count: 2
        }
        expect(response.body).to be_json_as(json)
      end
    end

    context '2ページ以上のお知らせ数の場合' do
      it '200が返り、お知らせ一覧が返ってくること' do
        get '/admin/notices/', params: { offset: 1 },
                               headers: login_headers(admin_user)

        expect(response.status).to eq 200
        json = {
          notices: [
            {
              id: notice1.id,
              title: notice1.title,
              content: notice1.content,
              post_at: notice1.post_at.strftime('%Y-%m-%d')
            }
          ],
          total_count: 2
        }
        expect(response.body).to be_json_as(json)
      end
    end
  end
end

describe 'POST /admin/notices', autodoc: true do
  let!(:admin_user) { create(:email_user, :admin_user, :registered) }
  let!(:title) { 'タイトル' }
  let!(:params) do
    { title: title, content: 'お知らせ内容', post_at: Time.zone.today }
  end

  context 'ログインしていない場合' do
    it '401が返ってくること' do
      post '/admin/notices/', params: ''

      expect(response.status).to eq 401
    end
  end

  context '正しい値が登録された場合' do
    it '201が返ってくること' do
      post '/admin/notices/', params: params, headers: login_headers(admin_user)

      expect(response.status).to eq 201
    end
  end

  context '値が空の場合' do
    let(:title) { '' }

    it '422とエラーメッセージが返ってくること' do
      post '/admin/notices/', params: params, headers: login_headers(admin_user)

      expect(response.status).to eq 422
      json = {
        error_messages: ['お知らせのタイトルを入力してください']
      }
      expect(response.body).to be_json_as(json)
    end
  end
end

describe 'PATCH /admin/notices/:id', autodoc: true do
  let!(:admin_user) { create(:email_user, :admin_user, :registered) }
  let!(:notice) { create(:notice) }
  let!(:title) { 'タイトル' }
  let!(:params) do
    { post_at: Time.zone.yesterday, title: title, content: 'お知らせ内容' }
  end

  context 'ログインしていない場合' do
    it '401が返ってくること' do
      patch "/admin/notices/#{notice.id}", params: ''

      expect(response.status).to eq 401
    end
  end

  context 'タイトルが変更された場合' do
    it '200が返ってくること' do
      patch "/admin/notices/#{notice.id}", params: params,
                                           headers: login_headers(admin_user)
      expect(response.status).to eq 200
      expect(Notice.last.title).to eq 'タイトル'
    end
  end

  context 'タイトルの値が空の場合' do
    let(:title) { '' }

    it '422とエラーメッセージが返ってくること' do
      patch "/admin/notices/#{notice.id}", params: params,
                                           headers: login_headers(admin_user)

      expect(response.status).to eq 422
      json = {
        error_messages: ['お知らせのタイトルを入力してください']
      }
      expect(response.body).to be_json_as(json)
    end
  end
end

describe 'DELETE /admin/notices/:id', autodoc: true do
  let!(:admin_user) { create(:email_user, :admin_user, :registered) }
  let!(:notice) { create(:notice) }

  context 'ログインしていない場合' do
    it '401が返ってくること' do
      delete "/admin/notices/#{notice.id}"

      expect(response.status).to eq 401
    end
  end

  context 'ログインしている場合' do
    it '200が返ってくること' do
      delete "/admin/notices/#{notice.id}", params: '',
                                            headers: login_headers(admin_user)
      expect(response.status).to eq 200
    end
  end
end
