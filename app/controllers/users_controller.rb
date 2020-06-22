class UsersController < ApplicationController

	get '/signup' do
		erb :"users/new"
	end

	post '/signup' do 
		#sanitize
		sanitize_input(params[:user])
		user = User.new(params[:user])
		if user.save
			#login
			session[:user_id] = user.id
	
		 	redirect to "/"
		else
		 	@error = user.errors.full_messages.join(" - ")
		 	erb :"users/new"
		end
	end

	get '/users/:id' do
		@user = User.find(params[:id])
		erb :"users/index"
    end 

    get '/users/:id/edit' do
        @user = User.find(params[:id])
        erb :"users/edit"
	end
	
	patch '/users/:id' do
		sanitize_input(params[:user])
		user = User.find(params[:id])
		user.update(params[:user])
		redirect to "users/#{user.id}"
	end

	delete '/users/:id' do
		user = User.find(params[:user][:id])
		user.teams.delete
		user.characters.delete
		user.destroy
		redirect to "/index"
	end

  
end
