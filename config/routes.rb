Rails.application.routes.draw do

  resources :tests

  root to: "job_posts#index"


  authenticate :client do
    resources :job_posts, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :job_posts, only: [:index, :show]

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', sessions: "users/sessions", invitations: 'users/invitations' }
  devise_for :clients, path: 'clients', controllers: { sessions: "clients/sessions" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :exams
  resources :exam_questions do
    resources :exam_options
  end
  resources :exam_answers
end