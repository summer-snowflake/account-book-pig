# frozen_string_literal: true

require 'rails_helper'

describe 'user:set_admin' do
  include_context 'rake'

  context 'user:set_admin' do
    let!(:user) { create(:email_user) }

    context 'when set the user id' do
      before do
        ENV['USER_ID'] = user.id.to_s
      end

      it 'add administrator authority to the user' do
        silence_stream(STDOUT) do
          subject.invoke
        end

        user.reload
        expect(user.admin?).to be_truthy
      end
    end

    context 'when not set the user id' do
      before do
        ENV['USER_ID'] = (user.id + 1).to_s
      end

      it 'add administrator authority to the user' do
        subject.invoke

        user.reload
        expect(user.admin?).to be_falsey
      end
    end
  end
end
