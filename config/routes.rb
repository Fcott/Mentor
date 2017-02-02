Rails.application.routes.draw do

  get 'profiles/edit'

  get 'profiles/update'

  root to: "pages#home"

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => { :omniauth_callbacks => "omniauth_callbacks",
                               :registrations => 'registrations'}

  resources :users, only: [:show] do
    get '/drafts'  => 'users#drafts'
    get '/saving'  => 'users#saving'
    get '/profile' => 'users#profile'
  end
  resources :profiles, only: [:edit, :update]

  resources :stories

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  mount ActionCable.server, at: '/cable'

  resources :savings, only: [:create, :destroy]
  resources :job_categories, only: [:show]

end
