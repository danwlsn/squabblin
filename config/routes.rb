ShinyHipster::Application.routes.draw do

	root 'questions#index'

	resources :questions
	resources :arguments
	resources :comments

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

end
