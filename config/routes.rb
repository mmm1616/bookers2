Rails.application.routes.draw do
       
   resources :users, only: [:index, :show, :edit, :update]
   resources :books, only: [:new, :create, :index, :show, :destroy] 

   devise_for :users
   root to: "homes#top"
   get "home/about", to: "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
