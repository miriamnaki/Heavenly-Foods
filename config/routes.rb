Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  
  get('/about',{to:'about#about'})
  get('/gallery',{to:'gallery#gallery'})
  get('/contact',{to:'contact#contact'})
  get('/reservation',{to:'reservation#reservation'})

  resources :users
  resources :menu_items
  resources :bookings

  
end
