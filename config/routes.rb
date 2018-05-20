Rails.application.routes.draw do
  get '/posts/index', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  post '/posts/new', to: 'posts#create'

  #bootstrapの導入
  root to: 'users#index'
  # get 'users/index'
  get '/users/index', to: 'users#index'

  get "/users/new", to: "users#new"
  post '/users/new', to: 'users#create'

  get '/users/:id/edit', to: 'users#edit'
  #url => users/1/edit
  #=> users/:id/edit の :id に代入される
  #=> :id => params[:id]

  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'


end
