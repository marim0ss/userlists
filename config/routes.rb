Rails.application.routes.draw do
  get 'sessions/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  root to: 'users#top'
  # get '/users/search', to: 'users#search'

  # ログイン / ログアウト
  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'


  #resourcesを使ってルートを記述 ネストしてuserモデルにpostモデルを紐付ける
  resources :users do
    resources :posts
  end
  # => index, show, new, create, edit, update, destroyのアクションに対応させることができる

end
