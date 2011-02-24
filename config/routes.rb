Jarvis::Application.routes.draw do
	
	resources :projects do
		member do
			get :messages
		end
	end
	
	resources :messages
	
	root :to => 'home#index'
	
	match 'jarvis.js' => 'jarvis#jarvis'
	match 'latest.js' => 'jarvis#latest'
end
