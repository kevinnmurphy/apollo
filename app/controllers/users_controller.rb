class UsersController < ApplicationController

	get '/signup' do
		erb :"users/new"
	end

	post '/signup' do 
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
		login_required
		permission_required
		erb :"users/index"
    end 

	get '/users/:id/edit' do
		login_required
		permission_required
        erb :"users/edit"
	end
	
	patch '/users/:id' do
		login_required
		permission_required
		sanitize_input(params[:user])
		if !params[:user][:name].blank?
			current_user.update(params[:user])
			flash[:message] = "Successfully updated user."
		end
		redirect to "users/#{current_user.id}"
	end

	delete '/users/:id' do
		login_required
		permission_required
		current_user.teams.try.delete
		current_user.characters.try.delete
		current_user.equips.try.delete
		current_user.destroy
		redirect to "/index"
	end


	
	def permission_required
		unless @user = current_user
		  flash[:alerts] = ["You don't have permission"]
		  redirect to "/index"
		end 
	  end
  
end
