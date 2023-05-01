Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
    resources :medicines, only: [:index, :edit, :create, :update, :destroy]
    resources :animal_species, only: [:index, :edit, :create, :update, :destroy]
  end

  scope module: :store do
    root to: 'homes#top'
    get '/about' => 'homes#about'
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
