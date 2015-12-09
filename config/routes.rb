Rails.application.routes.draw do
  root 'static_pages#home'
  get  'help'   => 'static_pages#help'
  get  'about'   => 'static_pages#about'
  get  'contact' => 'static_pages#contact'

  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users, only: :show
  resources :categories

end
