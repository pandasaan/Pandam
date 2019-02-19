Rails.application.routes.draw do

  root :to => 'items#top'
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  # users関連
  get '/users/delete' => 'users#cancel'
  patch '/users/delete' => 'users#flg_update'
  resource :users, only: [:show, :edit, :update]

  # shipments関連
  resources :shipments, only: [:create, :index, :edit, :update, :destroy]

  # orders関連
  get '/orders/:id/result' => 'orders#result'
  patch '/orders/:id' => 'orders#flg_update'
  patch '/orders/line_items/:id' => 'orders#item_flg_update'
  resources :orders, only: [:new, :create, :index, :show]

  # items関連
  resources :items, only: [:show]

  # artists関連
  resources :artists, only: [:new, :create, :index, :edit, :update, :destroy]

  # carts関連
  resources :carts, only: [:create, :index, :update, :destroy]

  # adminトップ
  get '/admin/top' => 'admins#top'

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :shipments, only: [:index, :edit, :update]
    resources :orders, only: [:show, :index]
    patch '/admin/orders/:id' => 'orders#flg_update'
    patch 'admin/orders/line_items/:id' => 'orders#item_flg_update'
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    patch '/admin/items/:id/flg_update' => 'items#flg_update'
    resources :labels, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :genres, only: [:new, :create, :edit, :update, :index, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
