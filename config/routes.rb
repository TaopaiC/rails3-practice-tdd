Rails3PracticeTdd::Application.routes.draw do
  resources :forums do
    resources :posts
  end
end
