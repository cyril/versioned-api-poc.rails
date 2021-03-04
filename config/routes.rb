Rails.application.routes.draw do
  scope module: :api do
    # @note Ancienne API

    namespace :v2 do
      get 'companies/', to: 'companies#show'
    end

    # @note Nouvelles APIs

    scope module: :v3, as: 'v3', constraints: ::Route::ApiVersionConstraints.new(version: 3, default: true) do
      get 'companies/', to: 'companies#show'
    end

    scope module: :v4, as: 'v4', constraints: ::Route::ApiVersionConstraints.new(version: 4) do
      get 'companies/', to: 'companies#show'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
