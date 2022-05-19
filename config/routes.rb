Rails.application.routes.draw do

  namespace :shop do
    get 'shops/show'
    get 'shops/edit'
  end
  scope module: :public do
    root to: "homes#top"
    get '/about' => "homes#about", as: "about"
  end

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
end
