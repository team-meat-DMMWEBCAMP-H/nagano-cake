Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :orders, only: [:index, :show, :update,]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :update, :create]
    resources :items, only: [:index, :new, :show, :edit, :update, :create]
    #get 'orders/show'
    #get 'customers/index'
    #get 'customers/show'
    #get 'customers/edit'
    #get 'genres/index'
    #get 'genres/edit'
    #get 'items/index'
    #get 'items/new'
    #get 'items/show'
    #get 'items/edit'
    #get 'homes/top'
  end

  #public
  scope module: :public do
    root to: "homes#top"
    #get 'home/about' => "homes#about"
    get '/about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    #resources :customers, only: [:show, :edit, :update]
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/check' => 'customers#check'
    patch 'customers/withdraw' => 'customers#withdraw'

    resources :cart_items, only: [:index, :update, :destroy]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm'
    # ↓URLをorders/completeからorder/completeに変更しました
    get 'order/complete' => 'orders#complete'

    resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]

    #get 'shipping_addresses/index'
    #get 'shipping_addresses/edit'
    #get 'orders/new'
    #get 'orders/complete'
    #get 'orders/index'
    #get 'orders/show'
    #get 'cart_items/index'
    #get 'customers/new'
    #get 'homes/top'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
