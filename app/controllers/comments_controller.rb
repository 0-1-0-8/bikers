class CommentsController < ApplicationController
	def create
	    comment = current_user.comments.new(comment_params)
	    comment.save
	    redirect_to bike_path(comment.bike_id)
	end
end
private
def comment_params
    params.require(:comment).permit(:user_id,:bike_id,:text)
end
