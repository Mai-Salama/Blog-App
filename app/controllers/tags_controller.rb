class TagsController < ApplicationController
	before_action :authentication

	def create
		blog = Blog.find(params[:blog_id])
		tag = Tag.new(tag_params)
		tag.blog_id = blog.id
		if tag.save
			render json: { message: tag }
		else
			render json: { message: "something went wrong"}
		end
	end

	def delete
		tag = Tag.find(params[:id])
		blog = Blog.find(tag.blog_id)
		tagForPost = Tag.where(blog_id: blog.id)
		allexcept = tagForPost.where.not(id: tag.id)
		if allexcept.empty?
			render json: { message: "can't delete all tags"}
		else
			tag.destroy
			render json: { message: "tag deleted"}
		end
	end

	def tag_params
		params.permit([:title])
	end
end