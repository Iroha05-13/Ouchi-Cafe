Rails.application.routes.draw do

  devise_for :shops, controllers: {
    registrations: "shop/registrations",
    sessions: "shop/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, except: [:new, :destroy]

    resources :shops, only: [:edit, :update, :destroy]

    root to: 'homes#top'
  end

  scope module: :public do
    resources :addresses, except: [:new]

    post 'orders/confirm', as: 'confirm'
    get 'orders/complete', as: 'complete'
    resources :orders, except: [:edit, :update, :destroy]

    get 'users/unsubscribe', as: 'unsubscribe'
    patch 'users/withdrawal', as: 'withdrawal'
    resource :users, only: [:show, :edit, :update] do
      resources :favorites, only: [:index]
    end

    root to: "homes#top"
    get '/about' => "homes#about", as: "about"

    delete 'cart_items/destroy_all', as: 'destroy_all'
    resources :cart_items, except: [:show, :new]

    resources :shops, only: [:index, :show]

    resources :items, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:new, :create, :destroy]
    end
  end

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :shop do
    get 'shop_user/:id' => 'shops#show', as: 'show_shop'
    resources :shops, only: [:edit, :update]
  end

  namespace :shop do
    resources :items, except: [:show, :destroy]
    resources :orders, only: [:index, :show, :update]
  end

end
