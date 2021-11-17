# frozen_string_literal: true

Rails.application.routes.draw do
  root 'games#index'
  resources :games, only: %i[index show new create] do
    resources :players, only: %i[show]
  end
end
