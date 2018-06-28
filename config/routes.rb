Rails.application.routes.draw do

  get 'status_etudiants/index/:id', to: "status_etudiants#index", as: 'satusE'
  resources :inscriptions
  resources :etabs_filieres
  
  get 'bot_twitter/direct_message', to: 'bot_twitter#direct_message', as: 'new_msg_twitter'
  get 'bot_twitter/get_followers', to: 'bot_twitter#get_followers', as: 'list_followers'
  get 'bot_twitter/get_screen_name', to: 'bot_twitter#get_screen_name', as: 'list_screen_name'
  get 'bot_twitter/send_public_tweet', to: 'bot_twitter#send_public_tweet', as: 'send_public_tweet'
  get 'bot_twitter/send_private_tweet', to: 'bot_twitter#send_private_tweet', as: 'send_private_tweet'
  
  resources :newsletter

  resources :mailing
  
  resources :articles

  resources :provinces

  resources :etabs

  resources :filieres

  devise_for :users

  resources :vagues

  root 'home#index'
end
