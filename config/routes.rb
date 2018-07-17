Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  root to: 'users#top'

  #resourcesを使ってルートを記述 ネストしてuserモデルにpostモデルを紐付ける
  resources :users do
    resources :posts
  end
  # => index, show, new, create, edit, update, destroyのアクションに対応させることができる

end
