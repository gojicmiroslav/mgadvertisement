class CommentsController < ApplicationController

	def index
		#advertisement = Advertisement.friendly.find(params[:advertisement_id])
		@comments = Comment.where(advertisement_id: params[:advertisement_id])
	end

	def create
		# { body: '', author: '', parent_id: id, advertisement_id: id }
		@comment = Comment.create(comment_params.merge(advertisement_id: params[:advertisement_id]))
	end

	def upvote
		Comment.upvote(params[:comment_id])
		@comment = Comment.find(params[:comment_id])
		render :create
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :author, :parent_id)
	end

end