class CommentsController < ApplicationController

	def create
    arg_id = params[:comment][:args_id]
    question = Question.find_by args_a: arg_id
    if question == nil
      question = Question.find_by args_b: arg_id
    end
    slug = question.slug
    comment_text = params[:comment][:comment]
    Comment.create(:comment=>comment_text, :args_id=> Integer(arg_id))
    # redirect_to "/questions/#{slug}", :status => :moved_permanently
    redirect_to question_path(slug)
	end

	def destroy
	end
end
