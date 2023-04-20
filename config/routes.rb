Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get "dad_jokes/home"
  root "application#hello"

  
  Rails.application.routes.draw do
    get 'dad_jokes', to: 'dad_jokes#index'
  end
  
end
