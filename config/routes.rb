Rails.application.routes.draw do
  root 'tests#index'

  get :signup, to: 'users#new'

  resources :users, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
