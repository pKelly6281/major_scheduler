Rails.application.routes.draw do

  get 'taken_courses/new'

  get 'user_major/new'

  get 'user_major/edit'
  get 'addTakenCourse' => 'taken_courses#new'
  get 'addCourse' => 'courses#new'
  get 'editUserMajor' => 'user_majors#edit'
  get 'majors/new'
  get 'addMajor' => 'majors#new'
  get 'sessions/new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'userShow' => 'users#show'
  get 'users/new'

  get 'addUserMajor' => 'user_majors#new'
  get 'yourSchedule' => 'users#your_schedule'

  get 'about' => 'main#about'

  get 'main/contact_us'
  #user controller
  get 'signup' =>'users#new'
  root 'main#home'
  resources :users
  resources :majors
  resources :user_majors
  resources :courses
  resources :taken_courses
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
