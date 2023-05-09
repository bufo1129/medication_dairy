Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
    resources :stores, only: [:index, :show, :edit, :update] #店舗
    resources :medicines, only: [:index, :edit, :create, :update, :destroy] #薬
    resources :seeds, only: [:index, :edit, :create, :update, :destroy] #種類
    resources :number_of_times, only: [:index, :create, :edit, :update, :destroy] #回数
    resources :dairies, only: [:index, :show] #日報
    resources :individuals, only: [:index, :show] #個体
    resources :weathers, only: [:index, :edit, :create, :update, :destroy] #天気
  end

  scope module: :store do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :each_stores, only: [:index, :show, :edit, :update] #店舗
    resources :dairies    #日報
    resources :medications #投薬記録
    resources :individuals #個体
    resources :medicines, only: [:show]#保留
    get "search" => "searches#search"
  end

  # ゲストログイン
  devise_scope :store do
    post 'store/guest_sign_in', to: 'store/sessions#guest_sign_in'
  end

#deviseルート
# 店舗客用
  devise_for :stores, skip: [:passwords], controllers: {
    registrations: "store/registrations",
    sessions: 'store/sessions'
  }

# 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


end
