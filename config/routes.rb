Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'home#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, skip: %i[passwords registrations]

  resources :courses do
    scope module: 'courses' do
      collection do
        resources :pending_courses, only: %i[index], controller: 'pending', as: :pending_courses
      end
      get 'change_status', on: :member, controller: 'pending'
    end
    resources :reviews, only: %i[create destroy]
  end
  scope module: 'reviews', path: 'reviews' do
    resources :pending_reviews, only: %i[index], controller: 'pending', as: :pending_reviews do
      get 'change_status', controller: 'pending'
    end
  end
end
