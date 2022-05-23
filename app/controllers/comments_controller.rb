class CommentsController < ApplicationController
	before_action :authentication

	def create
		usera = authentication
		blog = Blog.find(params[:blog_id])
		comment = Comment.new(comment_params)
		comment.user_id = usera.id
		comment.blog_id = blog.id
		if comment.save
			render json: { message: comment }
		else
			render json: { message: "something went wrong"}
		end
	end

	def edit
		usera = authentication
		comment = Comment.find(params[:id])
		return unless comment.user_id == usera.id
		if comment.update(comment_params)
			render json: { message: comment}
		else
			render json: { message: "something went wrong"}
		end
	end

	def delete
		usera = authentication
		comment = Comment.find(params[:id])
		return unless comment.user_id == usera.id
		comment.destroy
		render json: { message: "comment deleted"}
	end

	def comment_params
		params.require(:comment).permit([:body])
	end
end