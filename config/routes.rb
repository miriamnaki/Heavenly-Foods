Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  
  get('/about',{to:'about#about'})
  get('/gallery',{to:'gallery#gallery'})
  get('/contact',{to:'contact#contact'})
  post('/contact/send_email',{to:'contact#send_email'})

  get('/reservation',{to:'reservation#reservation'})
  

  resources :menu_items do
    resources :reviews
    collection do
      get 'price_search'
    end
  end
  resources :bookings
  resources :users
  resources :replies
  resource :session
  resources :shopping_cart_items do
    collection do
      get 'final_order'
      post 'add'
    end
  end
  resources :categories
  resources :menutypes
  resources :billings, only:[:new,:create]
  resources :payments, only:[:new,:create]
  get '/card/new' => 'billings#new_card', as: :add_payment_method
  post "/card" => "billings#create_card", as: :create_payment_method
  get '/success' => 'billings#success', as: :success
  get '/pay' => 'billings#pay', as: :pay
  resources :transactions
end
