Rails.application.routes.draw do



  root to: "job_posts#index"


  authenticate :client do
    resources :job_posts, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :job_posts, only: [:index, :show]

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', sessions: "users/sessions", invitations: 'users/invitations' }
  devise_for :clients, path: 'clients', controllers: { sessions: "clients/sessions" }
  get 'users/:id' => 'users#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :job_posts do
    resources :exams
  end
  resources :exams do
    resources :exam_questions
  end
  resources :exam_questions do
    resources :exam_options
  end
  resources :exams do
    resources :tests, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :exam_answers
  resources :test_answers
  resources :tests
end