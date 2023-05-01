Rails.application.routes.draw do

  namespace :admin do
    get 'medicines/index'
    get 'medicines/new'
    get 'medicines/show'
    get 'medicines/edit'
  end
# 店舗客用
  #ログイン
  devise_for :stores, skip: [:passwords], controllers: {
    registrations: "store/registrations",
    sessions: 'store/sessions'
  }

  #ルート
  scope module: :store do
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end


# 管理者用
  #ログイン
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #ルート
  namespace :admin do
    root to: 'homes#top'
  end

end
