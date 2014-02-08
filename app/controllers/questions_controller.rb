class QuestionsController < ApplicationController
	def index
		@test = "debug"
		respond_to do |format|
			format.html
			format.json {render json: @test}
		end
	end

	def create
	end

	def show
	end

	def update
	end

	def destroy
	end
end
