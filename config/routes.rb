Blocmarks::Application.routes.draw do
  devise_for :users
  resources :topics

  get 'about' => "welcome#about"

  root to: 'welcome#index'

end
