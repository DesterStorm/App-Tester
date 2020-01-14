Rails.application.routes.draw do
  root to: "job_posts#index"
  resources :job_posts
  devise_for :users
  devise_for :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
