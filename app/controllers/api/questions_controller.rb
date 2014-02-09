class Api::QuestionsController < ApplicationController

	respond_to :json

	def index
		question = Question.find(params[:id])
    args_a = Argument.find_by id: question.args_a
    args_b = Argument.find_by id: question.args_b
    comments_a = Comment.where(args_id: args_a.id).all
    comments_b = Comment.where(args_id: args_b.id).all

    args_a = args_a.as_json
    args_b = args_b.as_json
    args_a[:comments] = comments_a.count
    args_b[:comments] = comments_b.count

    full_json = question.as_json
    full_json[:arguments] = args_a, args_b

    respond_with :questions => full_json
	end

	def create
		question = params[:title]
    args_a_text = params[:args_a]
    args_b_text = params[:args_b]
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
	end

	def new
    question = params[:title]
    args_a_text = params[:args_a]
    args_b_text = params[:args_b]
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
    q = Question.create(:title=>question, :args_a=>args_a.id, :args_b=>args_b.id, :slug=>slug)
    respond_with :question => q
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
    args_a[:comments] = comments_a.count
    args_b[:comments] = comments_b.count

    full_json = question.as_json
    full_json[:arguments] = args_a, args_b

		respond_with :questions => full_json
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
