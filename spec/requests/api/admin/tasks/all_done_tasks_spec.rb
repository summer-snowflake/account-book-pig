# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/admin/tasks/all_done_tasks', autodoc: true do
  # TODO: mockを利用する

  context 'ログインしていない場合' do
    it '401が返ってくること' do
      post '/api/admin/tasks/all_done_tasks'
      expect(response.status).to eq 401
    end
  end

  context '管理者ではないユーザーがログインしている場合' do
    let!(:user) { create(:email_user, :registered) }

    it '401が返ってくること' do
      post '/api/admin/tasks/all_done_tasks', headers: login_headers(user)
      expect(response.status).to eq 401
    end
  end

  context '管理ユーザーがログインしている場合' do
    let!(:user) { create(:email_user, :admin_user, :registered) }

    # it '201が返ってくること' do
    #   post '/api/admin/tasks/all_done_tasks', headers: login_headers(user)
    #   expect(response.status).to eq 201
    # end
  end
end

describe 'DELETE /api/admin/tasks/all_done_tasks', autodoc: true do
  context 'ログインしていない場合' do
    it '401が返ってくること' do
      delete '/api/admin/tasks/all_done_tasks'
      expect(response.status).to eq 401
    end
  end

  context '管理者ではないユーザーがログインしている場合' do
    let!(:user) { create(:email_user, :registered) }

    it '401が返ってくること' do
      delete '/api/admin/tasks/all_done_tasks', headers: login_headers(user)
      expect(response.status).to eq 401
    end
  end

  context '管理ユーザーがログインしている場合' do
    let!(:user) { create(:email_user, :admin_user, :registered) }
    let!(:task) { create(:all_done_task, confirmed_on: 8.days.ago) }

    it '401が返り、8日前のタスクが削除されていること' do
      expect(AllDoneTask.count).to eq 1

      delete '/api/admin/tasks/all_done_tasks', headers: login_headers(user)
      expect(response.status).to eq 200

      expect(AllDoneTask.count).to eq 0
    end
  end
end
