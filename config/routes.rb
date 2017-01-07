Rails.application.routes.draw do

  root to: "pages#home"

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => { :omniauth_callbacks => "omniauth_callbacks",
                               :registrations => 'registrations'}

  resources :users, only: [:show] do
    get '/editing_stories' => 'users#editing_stories'
    get '/saved_stories' => 'users#saved_stories'
  end
  
  resources :stories

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  mount ActionCable.server, at: '/cable'

  resources :saves, only: [:create, :destroy]



end
