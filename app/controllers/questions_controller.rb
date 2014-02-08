class QuestionsController < ApplicationController
	def index
    questions = Question.all
    @question = questions.sample
	end

	def create
	end

	def show
    @question = Question.find_by id: params[:id]
	end

	def destroy
	end
end
