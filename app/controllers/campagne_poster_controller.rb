class CampagnePosterController < ApplicationController
	before_action :verifyUserSession

	def index
		@campagne = Campagne.includes(:entreprise).where(id:params[:id])
	end

	def poster
		participer = Participer.create(like:0, user_id:session[:id], campagne_id:params[:id], provider:params[:provider])
		puts participer.inspect
		# user = User.find_by_uid(session[:uid])
		# @graph = Koala::Facebook::API.new(user.user_token)
		# post_info = @graph.get_connection("me", "permissions")
		# @graph.put_connections("me", "feed", message: "I am posting on my page!ok!")
	end
end
