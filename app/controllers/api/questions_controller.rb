class Api::QuestionsController < ApplicationController

	respond_to :json

	def index
		@questions = Question.all
		respond_with :questions => @questions
	end

	def create
	end

	def show
		@question = Question.find(params[:id])
		@args = @question.arguments
		respond_with :question => @question, :arguments => @args
	end

	def random
		@questions = Question.all
		@question = @questions.sample
		# @args = @questions.arguments
		respond_with :questions => @question.as_json(include: :arguments)
	end

end
