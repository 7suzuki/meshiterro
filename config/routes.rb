Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  
  resources :post_images, only:[:new, :create, :index, :show]
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/about' =>'homes#about', as: 'about'
# get URL =>アクション名、asパス名
# get URLのとき/最初のスラッシュは不要
end
