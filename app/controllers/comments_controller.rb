class CommentsController < ApplicationController

	def create
		current_user.comments.create(comment_params)
	end

	private
	def comment_params
		params.require(:comment).permit(:tweeet_id, :body)
	end

end