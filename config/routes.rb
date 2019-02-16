Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  root :to => 'items#top'

  # users関連
  get '/users/cancel' => 'users#cancel'
  patch '/users/cancel' => 'users#flg_update'
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

  # carts関連
  resources :carts, only: [:create, :show, :update, :destroy]

  # adminトップ
  get '/admin/top' => 'admin#top'

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :shipments, only: [:index, :edit, :update]
    resources :orders, only: [:show, :index]
    patch '/admin/orders/:id' => 'orders#flg_update'
    patch 'admin/orders/line_items/:id' => 'orders#item_flg_update'
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    patch '/admin/items/:id/flg_update' => 'items#flg_update'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
