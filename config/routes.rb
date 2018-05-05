# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#show'

  namespace :api, format: :json do
    resources :heros, only: %i[index] do
      resources :hero_abilities, only: %i[index]
      resources :core_abilities, only: %i[index]
    end
    resources :vip_abilities, only: %i[index]
    resources :equipages, only: %i[show], param: :part
    resources :equipages, only: [] do
      resources :equipage_abilities, only: %i[show], param: :grade
    end
    resources :cards, only: %i[index] do
      resources :card_abilities, only: %i[show], param: :grade
    end
  end
end
