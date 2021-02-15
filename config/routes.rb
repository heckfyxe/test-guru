Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: :sessions }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    resources :gists, only: :create
    get :result, on: :member
  end

  resources :badges, only: :index

  namespace :admin, shallow: true do
    resources :gists, only: :index
    resources :badges

    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end
  end
end
