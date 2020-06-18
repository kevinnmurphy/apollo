class UsersController < ApplicationController

	get '/signup' do
		erb :"users/new"
	end

	post '/signup' do 
		#params[:user] = params[:user].values.gsub(/[\<\>\/]/, "")
		user = User.new(params[:user])
		if user.save
			#login
			session[:user_id] = user.id
	
		 	redirect to "/users/show"
		else
		 	@error = user.errors.full_messages.join(" - ")
		 	erb :"users/new"
		end
	  end

	  patch '/users/:id' do
		 	user = User.find(params[:user][:id])
		  	user.update(params[:user])
		  	redirect to "user/#{user.id}"
	  end

	  delete 'users/:id' do
		 	user = User.find(params[:user][:id])
		 	user.destroy
		 	redirect to "/index"
	  end
  
end
