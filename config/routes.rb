Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  
  get('/about',{to:'about#about'})
  get('/gallery',{to:'gallery#gallery'})
  get('/contact',{to:'contact#contact'})
  get('/reservation',{to:'reservation#reservation'})
  get('/allmenu',{to:'menu_items#allmenu'})

  resources :menu_items do
    resources :reviews
  end
  resources :bookings
  resources :users
  resource :session
  resources :shopping_cart_items
  resources :categories
  resources :menutypes

  
end
