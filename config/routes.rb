Rails.application.routes.draw do

  namespace :admin do
    get 'seeds/index'
    get 'seeds/edit'
  end
  namespace :admin do
    root to: 'homes#top'
    resources :medicines, only: [:index, :edit, :create, :update, :destroy]
    resources :seeds, only: [:index, :edit, :create, :update, :destroy]
    resources :stores, only: [:index, :show, :edit, :update] #店舗管理

    # resources :animal_species, only: [:index, :edit, :create, :update, :destroy]
  end

  scope module: :store do
    root to: 'homes#top'
    get '/about' => 'homes#about'

    #薬名
    resources :medicines, only: [:show]

    #店舗情報
    resources :each_stores, only: [:index, :show, :edit, :update]
    get 'each_stores/close'
    patch 'each_stores/withdraw'

    resources :dairies    #日報
    resources :medications #投薬記録
    resources :individuals #個体

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
