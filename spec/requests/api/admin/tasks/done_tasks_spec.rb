# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/admin/tasks/done_tasks', autodoc: true do
  context 'ログインしていない場合' do
    it '401が返ってくること' do
      post '/api/admin/tasks/done_tasks'
      expect(response.status).to eq 401
    end
  end

  context '管理者ではないユーザーがログインしている場合' do
    let!(:user) { create(:email_user, :registered) }

    it '401が返ってくること' do
      post '/api/admin/tasks/done_tasks', headers: login_headers(user)
      expect(response.status).to eq 401
    end
  end

  context '管理ユーザーがログインしている場合' do
    let!(:user) { create(:email_user, :admin_user, :registered) }
    let!(:yesterday) { Time.zone.yesterday }
    let!(:two_days_ago) { 2.days.ago }

    shared_examples_for 'whether the task is not there' do
      context '昨日完了したタスクが3件あった場合' do
        before do
          create(:all_done_task, confirmed_on: yesterday,
                                 board_name: 'ボード名１', card_name: 'カード１')
          create(:all_done_task, confirmed_on: yesterday,
                                 board_name: 'ボード名１', card_name: 'カード２')
          create(:all_done_task, confirmed_on: yesterday,
                                 board_name: 'ボード名２', card_name: 'カード３')
        end

        it '201が返ってくること' do
          post '/api/admin/tasks/done_tasks', headers: login_headers(user)
          expect(response.status).to eq 201
        end
      end

      context '昨日完了したタスクがなかった場合' do
        it '201が返ってくること' do
          post '/api/admin/tasks/done_tasks', headers: login_headers(user)
          expect(response.status).to eq 201
        end
      end
    end

    context 'すでに完了したタスクがある場合' do
      before do
        card1 = attributes_for(:all_done_task,
                               board_name: 'ボード名１', card_code: 'card1')
        attributes_for(:all_done_task, board_name: 'ボード名１', card_code: 'card2')

        AllDoneTask.create(card1.merge(confirmed_on: two_days_ago))
        AllDoneTask.create(card1.merge(confirmed_on: yesterday))
      end

      it_behaves_like 'whether the task is not there'
    end

    context 'すでに完了したタスクがない場合' do
      it_behaves_like 'whether the task is not there'
    end
  end
end
