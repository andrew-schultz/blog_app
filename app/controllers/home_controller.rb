class HomeController < ApplicationController
	def home
		if current_user
			@user = current_user
			@posts = Post.all
		else
			redirect_to log_in_path
		end
	end
end
