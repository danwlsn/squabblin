class QuestionsController < ApplicationController
	def index
    questions = Question.all
    @question = questions.sample
    @args_a = Argument.find(@question.args_a)
    @args_b = Argument.find(@question.args_b)
	end

	def create
    question = params[:question][:title]
    args_a_text = params[:question][:args_a]
    args_b_text = params[:question][:args_b]
    args_a = Argument.create(:text=>args_a_text)
    args_b = Argument.create(:text=>args_b_text)
    slug = to_slug(question)
    unique = false
    while unique == false
      if (Question.find_by slug: slug) == nil
        unique = true
      else
        slug.concat(rand(10).to_s)
      end
    end
    Question.create(:title=>question, :args_a=>args_a.id, :args_b=>args_b.id, :slug=>slug)
    redirect_to "/questions/#{slug}", :status => :moved_permanently
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
