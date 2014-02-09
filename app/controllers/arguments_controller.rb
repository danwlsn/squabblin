class ArgumentsController < ApplicationController
	def index
	end

	def create
	end

	def show
	end

	def upvote
		argument = Argument.find_by id: params[:id]
    argument.votes += 1
    argument.save
		redirect_to(:back)
	end

	def destroy
	end
end
