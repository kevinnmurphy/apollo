class SessionsController < ApplicationController

	get "/login" do
		erb :'sessions/login'
    end
    
	post "/login" do
		user = User.find_by_name(params[:user][:name])
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			erb :"users/show"
		else
			redirect "/login"
		end
    end

	get "/logout" do
		session.clear
		redirect "/"
	end
  
end
