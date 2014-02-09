class Api::ArgumentsController < ApplicationController
	respond_to :json

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
    respond_with :argument => argument
	end
end