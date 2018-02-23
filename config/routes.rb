Rails.application.routes.draw do
  get 'followers/index'

  get 'likes/create'
  get 'search', to: 'posts#search'

  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboards#show"
  end

  root to: "homes#show"

  post "text_posts" => "posts#create", defaults: { content_type: TextPost}
  post "pic_posts" => "posts#create", defaults: { content_type: PicPost}

  resources :posts, only: [:show, :index] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create, :show] do
    resources :followers, only: [:index]
    member do
      post "follow" => "followed_users#create"
      delete "unfollow" => "followed_users#destroy"
    end
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
