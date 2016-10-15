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
end
