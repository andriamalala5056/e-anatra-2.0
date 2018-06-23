Rails.application.routes.draw do
  get 'filieres/new'
  get 'filieres/create'
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

  resources :filieres, only: [:new, :create,]

  devise_for :users

  root 'home#index'
end
