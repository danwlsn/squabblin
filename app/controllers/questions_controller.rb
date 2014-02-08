class QuestionsController < ApplicationController
	def index
    questions = Question.all
    @question = questions.sample
    @args_a = Argument.find(@question.args_a)
    @args_b = Argument.find(@question.args_b)
    @comments_a = Comment.where(args_id: @args_a.id).all
    @comments_b = Comment.where(args_id: @args_b.id).all
    @comment = Comment.new
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
    @question = Question.find_by slug: params[:id]
    if @question != nil
      @args_a = Argument.find(@question.args_a)
      @args_b = Argument.find(@question.args_b)
      @comments_a = Comment.where(args_id: @args_a.id).all
      @comments_b = Comment.where(args_id: @args_b.id).all
      @comment = Comment.new
    else
      raise ActionController::RoutingError.new('Not Found')
    end
	end

  def update
    argument = Argument.find_by(params[:id])
    argument.votes += 1
    argument.save
  end

	def destroy
	end

  private
    def to_slug(name)
      #strip the string
      ret = name.strip

      #blow away apostrophes
      ret.gsub!(/['`]/, "")

      # @ --> at, and & --> and
      ret.gsub!(/\s*@\s*/, " at ")
      ret.gsub!(/\s*&\s*/, " and ")

      #replace all non alphanumeric, underscore or periods with underscore
      ret.gsub!(/\s*[^A-Za-z0-9\.\-]\s*/, '_')

      #convert double underscores to single
      ret.gsub!(/_+/,"_")

      #strip off leading/trailing underscore
      ret.gsub!(/\A[_\.]+|[_\.]+\z/,"")

      ret
    end
end
