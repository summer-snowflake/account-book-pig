# frozen_string_literal: true

require 'rails_helper'

describe 'GET /api/admin/tasks/done_tasks', autodoc: true do
  context 'ログインしていない場合' do
    it '401が返ってくること' do
      get '/api/admin/tasks/done_tasks'
      expect(response.status).to eq 401
    end
  end

  context '管理者ではないユーザーがログインしている場合' do
    let!(:user) { create(:email_user, :registered) }

    it '401が返ってくること' do
      get '/api/admin/tasks/done_tasks', headers: login_headers(user)
      expect(response.status).to eq 401
    end
  end

  context '管理ユーザーがログインしている場合' do
    let!(:user) { create(:email_user, :admin_user, :registered) }
    let!(:now) { Time.zone.now }
    let!(:yesterday) { 1.days.ago }

    shared_examples_for 'whether the task is not there' do
      context '昨日完了したタスクが3件あった場合' do
        before do
          create(:all_done_task, confirmed_at: now,
                                 board_name: 'ボード名１', card_name: 'カード１')
          create(:all_done_task, confirmed_at: now,
                                 board_name: 'ボード名１', card_name: 'カード２')
          create(:all_done_task, confirmed_at: now,
                                 board_name: 'ボード名２', card_name: 'カード３')
        end

        it '200が返ってくること' do
          pending '仕組み変更まで'
          get '/api/admin/tasks/done_tasks', headers: login_headers(user)
          expect(response.status).to eq 200
          json = {
            tasks: [
              {
                card_name: 'カード１'
              },
              {
                card_name: 'カード２'
              },
              {
                card_name: 'カード３'
              }
            ]
          }
          expect(response.body).to be_json_as(json)
        end
      end

      context '昨日完了したタスクがなかった場合' do
        it '200が返ってくること' do
          get '/api/admin/tasks/done_tasks', headers: login_headers(user)
          expect(response.status).to eq 200
        end
      end
    end

    context 'すでに完了したタスクがある場合' do
      before do
        card1 = attributes_for(:all_done_task,
                               board_name: 'ボード名１', card_code: 'card1')
        attributes_for(:all_done_task, board_name: 'ボード名１', card_code: 'card2')

        AllDoneTask.create(card1.merge(confirmed_at: yesterday))
        AllDoneTask.create(card1.merge(confirmed_at: now))
      end

      it_behaves_like 'whether the task is not there'
    end

    context 'すでに完了したタスクがない場合' do
      it_behaves_like 'whether the task is not there'
    end
  end
end
