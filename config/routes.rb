Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/posts/index', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  post '/posts/new', to: 'posts#create'
  #
  # #bootstrapの導入
  root to: 'users#index'
  resources :users
  # # get 'users/index'
  # get '/user/index', to: 'users#index'
  #
  #
  # get "/user/new", to: "users#new"
  # post '/user/new', to: 'users#create'
  #
  # get '/users/:id/edit', to: 'users#edit'
  # #url => users/1/edit
  # #=> users/:id/edit の :id に代入される
  # #=> :id => params[:id]
  #
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

# => index, show, new, create, edit, update, destroy

end
