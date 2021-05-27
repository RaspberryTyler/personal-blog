Rails.application.routes.draw do
  get '', to: 'posts#index'
  get '/journal' => redirect('/')
  get '/journal/:slug', to: 'posts#show', as: 'journal_entry'

  # https://gist.github.com/maxivak/5f24052e49f0974dac9d
  get "/sitemap.xml", to: "sitemap#index", format: "xml", as: 'sitemap'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
