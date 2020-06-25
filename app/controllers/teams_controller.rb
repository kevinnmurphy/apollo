class TeamsController < ApplicationController

    # before do
    #     login_required
    # end

    get '/teams' do
        login_required
        @teams = current_user.teams
         erb :"teams/index"
    end

    get '/teams/new' do
        login_required
        @teams = current_user.teams
        erb :"teams/new"
    end

    post '/teams' do
        login_required
        sanitize_input(params[:team])
        team = current_user.teams.create(params[:team])
        redirect "/teams/#{team.id}"
    end  

    get '/teams/:id' do
        login_required
        permission_required
        @team = current_user.teams.find_by_id(params[:id])
        erb :"teams/show"
    end 

    get '/teams/:id/edit' do
        login_required
        permission_required
        @characters = current_user.characters
        @team = current_user.teams.find_by_id(params[:id])
        erb :"teams/edit"
    end 
    
    patch '/teams/:id' do
        login_required
        permission_required
        sanitize_input(params[:team])
        team = current_user.teams.find_by_id(params[:id])
        if !params[:team][:name].blank?
            team.update(params[:team])
            flash[:message] = "Successfully updated team."
        else 
            redirect to "/characters/#{team.id}/edit"
        end
        redirect "teams/#{team.id}"
    end 
    
    delete '/teams/:id' do
        login_required
        permission_required
        team = current_user.teams.find_by_id(params[:id])
        team.destroy
        redirect "teams"
    end 
        

    private

    def permission_required
      unless @team = current_user.teams.find_by_id(params[:id])
        flash[:alerts] = ["You don't have permission"]
        redirect to "/teams"
      end 
    end

end