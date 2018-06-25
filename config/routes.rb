Rails.application.routes.draw do

  resources :etabs_filieres
  get 'newsletter/index'
  get 'newsletter/new'
  get 'newsletter/show'
  get 'newsletter/create'
  get 'newsletter/edit'
  get 'newsletter/update'
  get 'newsletter/destroy'
  
  get 'bot_twitter/direct_message', to: 'bot_twitter#direct_message', as: 'new_msg_twitter'
  get 'bot_twitter/get_followers', to: 'bot_twitter#get_followers', as: 'list_followers'
  get 'bot_twitter/get_screen_name', to: 'bot_twitter#get_screen_name', as: 'list_screen_name'
  get 'bot_twitter/send_public_tweet', to: 'bot_twitter#send_public_tweet', as: 'send_public_tweet'
  get 'bot_twitter/send_private_tweet', to: 'bot_twitter#send_private_tweet', as: 'send_private_tweet'
  
  get 'newsletter/send_newsletter', to: 'newsletter#send_newsletter'
  resources :newsletter

  resources :mailing
  
  resources :articles

  resources :provinces

  resources :etabs

  resources :filieres

  devise_for :users

  root 'home#index'
end
