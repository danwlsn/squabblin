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
		questions = Question.all
		question = questions.sample
    args_a = Argument.find_by id: question.args_a
    args_b = Argument.find_by id: question.args_b

    full_json = question.as_json
    full_json[:arguments] = args_a.as_json, args_b.as_json

		respond_with :questions => full_json
	end

end
