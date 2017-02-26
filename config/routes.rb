Rails.application.routes.draw do

  root to: "pages#home"

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => { :omniauth_callbacks => "omniauth_callbacks",
                               :registrations => 'registrations'}

  resources :users, only: [:show, :edit, :update] do
    get '/drafts'  => 'users#drafts'
    get '/saving'  => 'users#saving'
    get '/profile' => 'users#profile'
  end
  resources :profiles, only: [:edit, :update]

  resources :stories

  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  mount ActionCable.server, at: '/cable'

  resources :savings, only: [:create, :destroy]
  resources :job_categories, only: [:show]

end
