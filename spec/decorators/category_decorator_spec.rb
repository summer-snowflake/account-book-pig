# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CategoryDecorator, type: :decorator do
  let!(:user) { create(:email_user, :registered) }
  let!(:payments) { [true, false].sample }
  let!(:category) do
    create(:category, barance_of_payments: payments, user: user).decorate
  end

  describe '#human_payments_name' do
    context 'barance_of_payments is true' do
      let(:payments) { true }

      it 'is the same as nickname' do
        expect(category.human_payments_name).to eq '収入'
      end
    end

    context 'barance_of_payments is false' do
      let(:payments) { false }

      it 'is the same as auth name' do
        expect(category.human_payments_name).to eq '支出'
      end
    end
  end
end
