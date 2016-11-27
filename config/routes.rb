Rails.application.routes.draw do
  get 'periods/index'

  get 'periods/edit'

  get 'periods/new'

  get 'periods/show'

  root 'schools#index'

  get 'schools/edit'

  get 'schools/new'

  get 'schools/show'

  resources :schools do
    resources :periods
  end
end
