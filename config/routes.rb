Blocmarks::Application.routes.draw do
  resources :topics

  get 'about' => "welcome#about"

  root to: 'welcome#index'

end
