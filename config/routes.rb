Rails.application.routes.draw do
  root      'pages#samdhya'
  resources :pages, except: [:show]
  get       '/:id', to: 'pages#show', as: :show_page
end
