Rails.application.routes.draw do

  devise_for :shops
  devise_for :users
  devise_for :admins
end
