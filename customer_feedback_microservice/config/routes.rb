Rails.application.routes.draw do
  resources :submissions, only: %i[create index]
end
