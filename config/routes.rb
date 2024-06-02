Rails.application.routes.draw do
  # 管理者
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' =>'homes#about', as: 'about'
# get URL =>アクション名、asパス名
# get URLのとき/最初のスラッシュは不要  
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
  # get 'users/show'
  # get 'users/edit'  
end
