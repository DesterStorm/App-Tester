Rails.application.routes.draw do
  devise_for :users
  devise_for :clients

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :job_posts

  root to: "job_posts#index"
end
