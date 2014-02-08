class Api::QuestionsController < ApplicationController

	respond_to :json
	def index
		@test = "debug"
		respond_with @test
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
