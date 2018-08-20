Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  root to: 'users#top'
  get 'sessions/new'


  # ログイン / ログアウト
  get     'login',   to: 'sessions#new'     # メール・パスワードを入力させる
  post    'login',   to: 'sessions#create'    # 入力された情報を検証し、cookieにログイン情報を格納する
  delete  'logout',  to: 'sessions#destroy'    # ログアウトさせる



  #resourcesを使ってルートを記述 ネストしてuserモデルにpostモデルを紐付ける
  resources :users do
    resources :posts
  end
  # => index, show, new, create, edit, update, destroyのアクションに対応させることができる

end
