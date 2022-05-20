Rails.application.routes.draw do

  devise_for :shops, controllers: {
    registrations: "shop/registrations",
    sessions: "shop/sessions"
  }

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, except: [:new, :destroy]
  end
  namespace :admin do
    resources :shops, only: [:show,:destroy]
  end
  namespace :admin do
    root to: 'homes#top'
  end
  scope module: :public do
    resources :addresses, except: [:new]
  end
  scope module: :public do
    post 'orders/confirm', as: 'confirm'
    get 'orders/complete', as: 'complete'
    resources :orders, except: [:edit, :update, :destroy]
  end
  scope module: :public do
    resources :items, only: [:index]
  end
  scope module: :public do
    resources :shops, only: [:index, :show] do
      resources :items, only: [:show] do
        resource :favorites, only: [:create, :destroy]
        resources :post_comments, only: [:new, :create, :destroy]
      end
    end
  end
  scope module: :public do
    delete 'cart_items/destroy_all', as: 'destroy_all'
    resources :cart_items, except: [:show, :new]
  end
  scope module: :public do
    get 'users/unsubscribe', as: 'unsubscribe'
    patch 'users/withdrawal', as: 'withdrawal'
    resource :users, only: [:show, :edit, :update] do
      resources :favorites, only: [:index]
    end
  end
  scope module: :shop do
    get 'shop_user/:id' => 'shops#show', as: 'show_shop'
    resources :shops, only: [:edit, :update] do
      get 'items/:id' => 'items#show', as: 'show_item'
      resources :items, except: [:show, :destroy]
      resources :orders, only: [:index, :show, :update]
    end
  end
  scope module: :public do
    root to: "homes#top"
    get '/about' => "homes#about", as: "about"
  end

end
