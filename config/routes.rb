Rails.application.routes.draw do
  resources :disbursements do
    collection do
      get 'week'
    end
  end
end
