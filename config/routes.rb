Rails.application.routes.draw do 
	root 'pages#home'
	devise_for :users, path:'', path_names: {sign_in: 'login', sign_out:'logout', sign_up: 'register'}

	resources :profiles
	get 'profiles/:id', to: 'profiles#show', as: 'profile_show'

	get 'pages/home'
	get 'about-me', to: 'pages#about'
	get 'contact', to: 'pages#contact'
	resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
