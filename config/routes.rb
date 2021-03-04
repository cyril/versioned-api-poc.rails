Rails.application.routes.draw do
  scope constraints: ::Route::ApiConstraints.new do
    resources :companies
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
