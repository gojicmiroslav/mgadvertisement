class CommentsController < ApplicationController

	def create
		# { body: '', author: '', advertisement_id: id }
		@comment = Comment.create(comment_params.merge(advertisement_id: params[:advertisement_id]))
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :author)
	end

end