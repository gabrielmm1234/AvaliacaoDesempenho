Rails.application.routes.draw do

  resources :areas
  resources :evaluations
  resources :evaluation_models
  resources :evaluation_factors
  resources :answer_options
  resources :questions

  get '/results' => 'results#index', :as => 'results'
  get '/results/:id' => 'results#show', :as => 'show_results'

  get '/tutorial' => 'tutorial#tutorial', :as => 'tutorial'

  get '/avaliar/:id/' => 'evaluations#responder', :as => 'responder'
  get '/avaliar' => 'evaluations#evaluation', :as => 'avaliar'
  get "info" => "infos#index", :as => 'info'
  get "/pessoas_EJ" => "infos#create"
  get '/home' => 'static_pages#home'

  post '/select_evaluation_factors' => 'evaluation_factors#select'

  post '/request_histories/aprovar_requisicao/:id' =>
       'request_histories#aprovar_requisicao', as: :aprovar_requisicao

  patch '/avaliar/:id' => 'evaluations#salvar'

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :request_histories
  resources :junior_enterprises
  resources :profiles
  resources :roles
  resources :users, except: [:new, :create]

  devise_scope :user do
    root to: "devise/sessions#new"
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

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
