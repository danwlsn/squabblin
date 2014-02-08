class CommentsController < ApplicationController

	def create
    arg_id = params[:comment][:args_id]
    slug = Question.find_by args_a: arg_id
    if slug == nil
      slug = Question.find_by args_b: arg_id
    end
    comment_text = params[:comment][:comment]
    Comment.create(:comment=>comment_text, :args_id=> Integer(arg_id))
	end

	def destroy
	end
end
