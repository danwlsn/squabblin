class QuestionsController < ApplicationController
	def index
    questions = Question.all
    @question = questions.sample
	end

	def create
    question = params[:question][:title]
    args_a_text = params[:question][:args_a]
    args_b_text = params[:question][:args_b]
    args_a = Argument.create(:text=>args_a_text)
    args_b = Argument.create(:text=>args_b_text)
    Question.create(:title=>question, :args_a=>args_a.id, :args_b=>args_b.id)
	end

  def new
    @question = Question.new
  end

	def show
    @question = Question.find_by id: params[:id]
	end

	def destroy
	end
end
