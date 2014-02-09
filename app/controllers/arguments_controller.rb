class ArgumentsController < ApplicationController
	def index
	end

	def create
	end

	def show
	end

	def upvote
		@argument = Argument.find_by(params[:id])
    if @argument.update_attributes(:votes => 99)
	    redirect_to root_path
	  end
	end

	def destroy
	end
end
