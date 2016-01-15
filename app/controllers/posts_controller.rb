class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to home_path
		else
			flash[:notice] = "There was a problem creating your post, please try again."
			redirect_to :back
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		if @post.save
			redirect_to @post
		else
			flash[:notice] = "There was a problem editing your post, please try again."
			redirect_to :back
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to home_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end
end
