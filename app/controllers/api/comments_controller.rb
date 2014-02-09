class Api::CommentsController < ApplicationController

  respond_to :json

	def new
    arg_id = params[:id]
    comment_text = params[:comment]
    Comment.create(:comment=>comment_text, :args_id=> Integer(arg_id))
    respond_with :added => "comment"
	end

	def destroy
	end
end
