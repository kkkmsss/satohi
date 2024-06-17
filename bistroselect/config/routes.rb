Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'foods/tag' => 'foods#tag'
  get 'foods/top' => 'foods#top'

  resources :users, only: [:show]

  resources :foods 

  root 'foods#top'

 
  
  
end
