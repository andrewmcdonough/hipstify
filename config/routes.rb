Spotview::Application.routes.draw do

  resources :blogs
  resources :review
  resources :recordings
  resources :artist

  root :to => "blogs#index"

end
