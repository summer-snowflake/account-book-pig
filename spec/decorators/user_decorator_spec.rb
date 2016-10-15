# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UserDecorator, type: :decorator do
  describe '#screen_name' do
    context 'email user nickname is empty' do
      let!(:user) { create(:email_user, :registered, nickname: '').decorate }

      it 'is EmailUser' do
        expect(user.screen_name).to eq user.email
      end
    end

    context 'twitter user nickname is empty' do
      let!(:user) { create(:twitter_user, :registered, nickname: '').decorate }

      it 'is EmailUser' do
        expect(user.screen_name).to eq user.auth.name
      end
    end

    context 'facebook user nickname is empty' do
      let!(:user) { create(:facebook_user, :registered, nickname: '').decorate }

      it 'is EmailUser' do
        expect(user.screen_name).to eq user.auth.name
      end
    end
  end

  describe '#human_type_name' do
    context 'type is EmailUser' do
      let!(:user) { create(:email_user, :registered).decorate }

      it 'human_type_name is メールアドレス経由' do
        expect(user.human_type_name).to eq 'メール登録'
      end
    end

    context 'type is TwitterUser' do
      let!(:user) { create(:twitter_user, :registered).decorate }

      it 'human_type_name is Twitter経由' do
        expect(user.human_type_name).to eq 'Twitter経由'
      end
    end

    context 'type is FacebookUser' do
      let!(:user) { create(:facebook_user, :registered).decorate }

      it 'human_type_name is Facebook経由' do
        expect(user.human_type_name).to eq 'Facebook経由'
      end
    end
  end

  describe '#human_status_name' do
    context 'status is :inactive' do
      let!(:user) { create(:email_user, :inactive).decorate }

      it 'human_status_name is 仮登録' do
        expect(user.human_status_name).to eq '仮登録'
      end
    end

    context 'status is :registered' do
      let!(:user) { create(:email_user, :registered).decorate }

      it 'human_status_name is 登録済み' do
        expect(user.human_status_name).to eq '登録済み'
      end
    end
  end
end
