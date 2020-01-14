Rails.application.routes.draw do
  root to: "job_posts#index"
  resources :job_posts
  resources :exams

  devise_for :users
  devise_for :clients

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :exams
  resources :exam_questions do
    resources :exam_options
  end
  resources :exam_answers
  get 'written' => 'exams#written', :as => 'exam/written_test'
end
