class SessionsController < ApplicationController

	get "/login" do
		reroute_if_logged_in
		erb :'/sessions/login'
    end
    
	post "/login" do
		user = User.find_by_name(params[:user][:name])
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			erb :"users/index"
		else
			redirect "/login"
		end
    end

	get "/logout" do
		session.clear
		redirect "/"
	end

	private

	def reroute_if_logged_in
	  if logged_in?
		flash[:alerts] = ["You are already logged in"]
		erb :"users/index"
	  end
	end
  
end
