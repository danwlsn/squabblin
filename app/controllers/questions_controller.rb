class QuestionsController < ApplicationController
	def index
    questions = Question.all
    @rand_id = questions.sample.id
	end

	def create
	end

	def show
    @question = Question.find_by id: params[:id]
    puts @question
	end

	def destroy
	end
end
