ShinyHipster::Application.routes.draw do

	root 'questions#index'

	resources :questions
	resources :arguments do
		member do
			get :upvote
		end
	end
	resources :comments


	# API
	namespace :api, :defaults => { :format => "json" } do
		resources :questions do
			collection do
				get 'random'
			end
		end
		resources :arguments do
			collection do
				get 'upvote'
				get 'comments'
			end
		end
		resources :comments
	end

end
