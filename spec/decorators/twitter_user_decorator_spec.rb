# frozen_string_literal: true
require 'rails_helper'

RSpec.describe TwitterUserDecorator, type: :decorator do
  let!(:user) { create(:twitter_user, :registered).decorate }

  describe '#screen_name' do
    context 'nickname is not empty' do
      it 'is the same as nickname' do
        expect(user.screen_name).to eq user.nickname
      end
    end

    context 'nickname is empty' do
      before do
        user.nickname = ''
        user.save
      end

      it 'is the same as auth name' do
        expect(user.screen_name).to eq user.auth.name
      end
    end
  end
end
