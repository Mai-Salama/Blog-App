class BlogsController < ApplicationController
	before_action :authentication

	def create
		usera = authentication
		blog = Blog.new(blog_params)
		blog.user_id = usera.id
		if blog.save
			tag = Tag.new(tag_params)
			tag.blog_id = blog.id
			if tag.save
				render json: { message: blog }
			else
				render json: { message: "something went wrong while creating the tag"}
			end
		else
			render json: { message: "something went wrong"}
		end
	end

	def edit
		usera = authentication
		blog = Blog.find(params[:id])
		return unless blog.user_id == usera.id
		if blog.update(blog_params)
			render json: { message: blog}
		else
			render json: { message: "something went wrong"}
		end
	end

	def delete
		usera = authentication
		blog = Blog.find(params[:id])
		return unless blog.user_id == usera.id
		blog.destroy
		render json: { message: "blog deleted"}
	end

	def blog_params
		params.require(:blog).permit(:title, :body)
	end

	def tag_params
		params.require(:tag).permit(:title)
	end
end