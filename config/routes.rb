Rails.application.routes.draw do
  get "/orders/result" => "orders#modal"

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

  resources :users, only: [:show, :edit, :update] do
    resources :shipments, only: [:create, :index, :edit, :update, :destroy]
  end


  # shipments関連


  # delete "/users/:user_id/shipments/:id" => "shipments#destroy", as: "delete_shipment"

  # orders関連
  resources :orders, only: [:new, :create, :index, :show]
  get '/orders/:id/result' => 'orders#result', as: "result_order"
  put "order/:id/show" => 'orders#flg_update', as:"flg_update_order"
  patch '/orders/line_items/:id' => 'orders#item_flg_update'

  # items関連
  resources :items, only: [:show]

  # carts関連
  resources :carts, only: [:create, :index, :update, :destroy]

  # adminトップ
  get '/admin/top' => 'admins#top'

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :shipments, only: [:index, :edit, :update]
    resources :orders, only: [:show, :index]
    patch '/orders/:id/dlv' => 'orders#dlv_flg_update'
    patch '/orders/:id/cancell' => 'orders#flg_update'
    patch '/orders/line_items/:id/cancell' => 'orders#item_flg_update'
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    patch '/items/:id/flg_update' => 'items#flg_update'
    resources :artists, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :labels, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :genres, only: [:new, :create, :edit, :update, :index, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
