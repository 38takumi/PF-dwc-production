Rails.application.routes.draw do
  # 出来ればこっち
  # root to: 'home#top'
  root to: "events#index"

  devise_for :customers

  resources :events

  resources :goals do
    resources :goal_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :customers, only: [:show, :index, :edit, :update] do
    # follow、follower機能　ここから
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    # follow、follower機能　ここまで
  end

  get 'search' => 'searches#search'
  get 'home/about' => 'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end