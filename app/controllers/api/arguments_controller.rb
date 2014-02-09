class Api::ArgumentsController < ApplicationController
	respond_to :json

	def formatted_created_at
    created_at.strftime("%b %d, %Y")
  end

  def as_json(args={})
    super(:methods=>:formatted_created_at, :except=>:date)
  end

	def index
		argument = Argument.all
		respond_with :arguments => argument
	end

	def show
		argument = Argument.find(params[:id])
		@comments = Comment.where(args_id: argument.id).all
		respond_with :comments => @comments
	end

	def comments
		argument = Argument.find(params[:id])
		@comments = Comment.where(args_id: argument.id).all
		respond_with :comments => @comments
	end

	def upvote
		argument = Argument.find_by id: params[:id]
    argument.votes += 1
    argument.save
    comments = Comment.where(args_id: argument.id).all

    full_json = argument.as_json
    full_json[:comments] = comments.count

		respond_with :arguments => full_json
	end
end