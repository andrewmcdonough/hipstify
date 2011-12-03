Spotview::Application.routes.draw do

  resources :blogs do
    resources :reviews
  end
  resources :review
  resources :recordings
  resources :artist

  root :to => "blogs#index"

end
