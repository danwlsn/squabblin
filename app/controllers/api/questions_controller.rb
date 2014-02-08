class Api::QuestionsController < ApplicationController

	respond_to :json

	def index
		@questions = Question.find(1)
		@args = @questions.arguments
		respond_with :questions => @questions, :args => @args
	end

	def create
	end

	def show
	end

	def update
	end

	def random
		@questions = Question.find(1)
		@args = @questions.arguments
		respond_with :questions => @questions, :args => @args
	end

	def destroy
	end
end
