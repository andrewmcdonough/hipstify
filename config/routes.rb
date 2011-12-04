Spotview::Application.routes.draw do

  resources :blogs do
    resources :reviews
  end
  resources :reviews
  resources :recordings
  resources :artists


  root :to => "blogs#index"

end
