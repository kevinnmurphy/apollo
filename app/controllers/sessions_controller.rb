class SessionsController < ApplicationController

	get "/login" do
		reroute_if_logged_in
    end
    
	post "/login" do
		user = User.find_by_name(params[:user][:name])
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			redirect to "/users/#{current_user.id}"
		else
			redirect to "/login"
		end
    end

	get "/logout" do
		session.clear
		redirect to "/"
	end

	private

	def reroute_if_logged_in
	  if logged_in?
		flash[:alerts] = ["You are already logged in"]
		erb :"users/index"
	  else
		erb :login
	  end
	end
  
end
