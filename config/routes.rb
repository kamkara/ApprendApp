Rails.application.routes.draw do
  devise_for :users
  
  resources :courses, except:[:show]

   ############ Courses  ###############
  resources :courses, only:[:show] do
    resources :exercices, only:[:new, :create, :destroy, :edit, :update]
  end
  
  ############ Exercises  ###############
  resources :exercices, only:[:show, :index] do
    #resources :results, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "courses#index"
end
