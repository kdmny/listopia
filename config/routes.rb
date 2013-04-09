Rails.application.routes.draw do
  resources :list_items do
    collection do
      post :sort
    end
  end
  resources :lists
end
