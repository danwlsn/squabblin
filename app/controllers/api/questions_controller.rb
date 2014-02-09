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
    comments_a = Comment.where(args_id: args_a.id).all
    comments_b = Comment.where(args_id: args_b.id).all
    args_a = args_a.as_json
    args_b = args_b.as_json
    args_a[:comments] = comments_a.as_json
    args_b[:comments] = comments_b.as_json

    full_json = question.as_json
    full_json[:arguments] = args_a, args_b

		respond_with :questions => full_json
	end

end
