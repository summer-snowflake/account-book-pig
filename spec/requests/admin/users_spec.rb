# frozen_string_literal: true

require 'rails_helper'

describe 'GET /admin/users', autodoc: true do
  let!(:user) { create(:email_user, :registered).decorate }
  let!(:admin_user) { create(:email_user, :admin_user, :registered).decorate }

  context 'ログインしていない場合' do
    it '401が返ってくること' do
      get '/admin/users/', params: ''

      expect(response.status).to eq 401
    end
  end

  context '一般ユーザーとしてログインしている場合' do
    it '401が返ってくること' do
      get '/admin/users/', params: '', headers: login_headers(user)

      expect(response.status).to eq 401
    end
  end

  context '管理ユーザーとしてログインしている場合' do
    context '1ページ以内のユーザー数の場合' do
      let(:sign_in_at) { Time.zone.now }
      before do
        Timecop.freeze(sign_in_at)
      end

      it '200が返り、ユーザー一覧が返ってくること' do
        get '/admin/users/', params: '', headers: login_headers(admin_user)

        expect(response.status).to eq 200
        json = {
          users: [
            {
              id: admin_user.id,
              admin: admin_user.admin?,
              type_label_name: admin_user.type_label_name,
              type: admin_user.human_type_name,
              status_label_name: admin_user.status_label_name,
              status: admin_user.human_status_name,
              nickname: admin_user.nickname,
              email: admin_user.email,
              last_sign_in_at: I18n.l(sign_in_at)
            },
            {
              id: user.id,
              admin: user.admin?,
              type_label_name: user.type_label_name,
              type: user.human_type_name,
              status_label_name: user.status_label_name,
              status: user.human_status_name,
              nickname: user.nickname,
              email: user.email,
              last_sign_in_at: I18n.l(user.last_sign_in_at)
            }
          ],
          total_count: 2
        }
        expect(response.body).to be_json_as(json)
      end
    end

    context '2ページ以上のユーザー数の場合' do
      it '200が返り、ユーザー一覧が返ってくること' do
        get '/admin/users/', params: { offset: 1 },
                             headers: login_headers(admin_user)

        expect(response.status).to eq 200
        json = {
          users: [
            {
              id: user.id,
              admin: user.admin?,
              type_label_name: user.type_label_name,
              type: user.human_type_name,
              status_label_name: user.status_label_name,
              status: user.human_status_name,
              nickname: user.nickname,
              email: user.email,
              last_sign_in_at: I18n.l(user.last_sign_in_at)
            }
          ],
          total_count: 2
        }
        expect(response.body).to be_json_as(json)
      end

      after do
        Timecop.return
      end
    end
  end
end

describe 'GET /users/:id', autodoc: true do
  let!(:user) { create(:email_user, :registered).decorate }
  let!(:admin_user) { create(:email_user, :admin_user, :registered).decorate }

  context 'ログインしていない場合' do
    it '401が返ってくること' do
      get "/admin/users/#{user.id}", params: ''

      expect(response.status).to eq 401
    end
  end

  context '一般ユーザーとしてログインしている場合' do
    it '401が返ってくること' do
      get "/admin/users/#{user.id}", params: '', headers: login_headers(user)

      expect(response.status).to eq 401
    end
  end

  context '管理ユーザーとしてログインしている場合' do
    it '200が返り、ユーザー一覧が返ってくること' do
      get "/admin/users/#{user.id}", params: '',
                                     headers: login_headers(admin_user)

      expect(response.status).to eq 200
      json = {
        id: user.id,
        admin: user.admin?,
        type_label_name: user.type_label_name,
        type: user.human_type_name,
        status_label_name: user.status_label_name,
        status: user.human_status_name,
        nickname: user.nickname,
        email: user.email,
        last_sign_in_at: I18n.l(user.last_sign_in_at)
      }
      expect(response.body).to be_json_as(json)
    end
  end
end
