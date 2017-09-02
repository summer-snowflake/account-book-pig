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

  describe '#last_login_time' do
    context 'last_sign_in_at is nil' do
      let!(:user) do
        create(:email_user, :registered, last_sign_in_at: nil).decorate
      end

      it 'last_login_time is empty' do
        expect(user.last_login_time).to be_nil
      end
    end

    context 'last_sign_in_at is not nil' do
      let!(:user) do
        create(:email_user, :registered,
               last_sign_in_at: Time.zone.local(2016, 9, 1, 9, 0, 0)).decorate
      end

      it 'last_login_time is empty' do
        expect(user.last_login_time).to eq '2016/09/01 09:00:00'
      end
    end
  end

  describe 'max count' do
    let!(:user) { create(:email_user, :registered).decorate }
    let!(:admin_user) { create(:email_user, :registered, :admin_user).decorate }

    shared_examples_for 'max count' do
      context 'admin is true' do
        it 'max count is 5' do
          expect(admin_max_count).to eq 5
        end
      end

      context 'admin is false' do
        it 'max count is 3' do
          expect(max_count).to eq 3
        end
      end
    end

    describe '#max_category_count' do
      let(:admin_max_count) { admin_user.max_category_count }
      let(:max_count) { user.max_category_count }

      it_behaves_like 'max count'
    end

    describe '#max_place_count' do
      let(:admin_max_count) { admin_user.max_place_count }
      let(:max_count) { user.max_place_count }

      it_behaves_like 'max count'
    end

    describe '#max_record_count' do
      let(:admin_max_count) { admin_user.max_record_count }
      let(:max_count) { user.max_record_count }

      it_behaves_like 'max count'
    end
  end
end
