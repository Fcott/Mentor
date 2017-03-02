Rails.application.routes.draw do

  root to: "pages#home"
  get '/for_you' => 'pages#for_you'

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => { :omniauth_callbacks => "omniauth_callbacks",
                               :registrations => 'registrations'}

  resources :users,          only: [:show, :edit, :update] do
    get '/drafts'  => 'users#drafts'
    get '/saving'  => 'users#saving'
    get '/profile' => 'users#profile'
    member do
      get :followings, :followers
    end
  end

  resources :profiles,       only: [:edit, :update]

  resources :stories do
    resource :like, module: :stories
  end

  resources :conversations,  only: [:index, :show, :create] do
    resources :messages,     only: [:create]
  end

  resources :savings,        only: [:create, :destroy]
  resources :job_categories, only: [:show]
  resources :relationships,  only: [:create, :destroy]

end
