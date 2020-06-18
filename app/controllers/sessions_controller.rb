class SessionsController < ApplicationController

	get "/login" do
		erb :'sessions/login'
    end
    
    post "/login" do
		user = User.find_by_name(params[:user][:name])
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			erb :"sessions/success"
		else
			redirect "/sessions/login"
		end
    end

	get "/success" do
		if Helpers.logged_in?(session)
			erb :success
		else
			redirect "/sessions/login"
		end
	end

	get "/logout" do
		session.clear
		redirect "/"
	end
  
end
