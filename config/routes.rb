Rails.application.routes.draw do
  get 'scrapertest/prompt'
  get '/inspireme' => 'application#scrape_reddit'
  get 'homepage/index'
  root 'welcome#index'

 get "post/:post_id" => "posts#show"
 get "posts/search_index" => "posts#search_index" 
  devise_for :views
  devise_for :users
  resources  :posts
  get 'welcome/index'
  get 'users/:id/posts' => 'users#posts', :as => :user_posts
  get 'posts/view' => 'view#posts'
mount Commontator::Engine => '/commontator'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
