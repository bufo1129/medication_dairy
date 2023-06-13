Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
    get 'searches/search'
    resources :stores, only: [:index, :show, :edit, :update]
    resources :medicines, only: [:index, :edit, :create, :update, :destroy]
    resources :seeds, only: [:index, :edit, :create, :update, :destroy]
    resources :number_of_times, only: [:index, :create, :edit, :update, :destroy]
    resources :dairies, only: [:index, :show]
    resources :individuals, only: [:index, :show, :edit, :update]
    resources :weathers, only: [:index, :edit, :create, :update, :destroy]

    resources :medications, only: [:index, :show, :create] do
      resources :comments, only: [:create, :destroy] do
        resources :sees, only: [:create, :destroy]
      end
    end
  end

  scope module: :store do
    root to: 'homes#top'
    get "home/about" => "homes#about", as: "about"
    get "search" => "searches#search"
    resources :each_stores, only: [:index, :show, :edit, :update]
    resources :dairies do
      get 'copy'
    end
    resources :individuals

    resources :medications do
      resources :comments, only: [:create, :destroy] do
        resources :sees, only: [:create, :destroy]
      end
      member do
        resource :favorites, only: [:create, :destroy]
      end

    end

  end

  # ゲストログイン
  devise_scope :store do
    post 'store/guest_sign_in', to: 'store/sessions#guest_sign_in'
  end

#deviseルート
# 店舗用
  devise_for :stores, skip: [:passwords], controllers: {
    registrations: "store/registrations",
    sessions: 'store/sessions'
  }

# 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end
