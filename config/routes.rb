Rails.application.routes.draw do
  get '', to: 'posts#index'
  get '/posts/:slug', to: 'posts#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
