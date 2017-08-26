# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User::EmailUpdator, type: :model do
  let!(:user) { create(:email_user, :registered, new_email: new_email) }
  let!(:updator) { User::EmailUpdator.new(email_params) }
  let!(:email_params) { { user_id: user.id, token: token } }
  let!(:token) { user.add_new_email_token.token }
  let(:new_email) { 'new_email@example.com' }

  it 'has user' do
    expect(updator.user).to eq user
  end

  describe '#authorize' do
    context 'token is valid' do
      it 'updated new email' do
        expect(user.new_email).to eq new_email
        updator.authorize
        user.reload
        expect(user.email).to eq new_email
        expect(user.new_email).to eq ''
      end
    end

    context 'token is invalid' do
      let(:token) { 'invalid_token' }

      it 'dont update new email' do
        expect(user.new_email).to eq new_email
        updator.authorize
        user.reload
        expect(user.new_email).to eq new_email
      end
    end
  end
end
