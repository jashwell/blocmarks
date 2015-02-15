Blocmarks::Application.routes.draw do

  devise_for :users
  resources :topics do
    resources :bookmarks
  end

  get 'about' => "welcome#about"

  root to: 'welcome#index'

  post :incoming, to: "incoming#create"

end
