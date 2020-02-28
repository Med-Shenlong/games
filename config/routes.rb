Rails.application.routes.draw do



root to: 'pages#index'




  get '/profil', to: 'users#edit', as: :profil
  get '/class/:slug', to: 'posts#categories', as: :categories_posts
  patch '/profil', to: 'users#update'



  #Session

  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' , as: :destroy_session


  resources :posts do

  collection do

    get 'me'

  end

  end

  resources :passwords, only: [:new, :create, :edit, :update]
  resources :games do

  resource :subscriptions, only: [:create, :destroy]

  end

  resources :users, only: [:new, :create, :edit] do

    member do
      get 'confirm'

end
end

scope 'superadmin', module: 'admin', as: 'admin' do
resources :categories, except: [:show]




end
end
