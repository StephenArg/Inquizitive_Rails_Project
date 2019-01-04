Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#homepage'
  # get 'users#login'

  resources :users
  resources :user_questions
  resources :posts
  resources :questions

  resource :user do
    get "login"
    post "login_post"
    get "guest"
    get "user_feed"
    get "delete_user", as: "delete"
    delete "delete", as: "multi_delete"
  end

  resource :question do
    get "topics"
    get "subjects"
    get "questions"
    get "result"
    delete "delete_question"
  end

  resource :post do
    delete "delete_comment"
    delete "delete_post"
  end

  post "/questions/:id/result", to: "questions#result"
  post "/posts/comment", to: "posts#comment"
  get "/users/not_authorized", to: "users#not_authorized"
  
end
