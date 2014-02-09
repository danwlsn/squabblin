class Api::ArgumentsController < ApplicationController
	respond_to :json

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

	def vote
	end
end