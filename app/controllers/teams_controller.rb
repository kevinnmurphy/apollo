class TeamsController < ApplicationController

    # before do
    #     login_required
    # end

    get '/teams' do
        @teams = current_user.teams
         erb :"teams/index"
    end

    get '/teams/new' do
        @teams = current_user.teams.all
        erb :"teams/new"
    end

    post '/teams' do
        sanitize_input(params[:team])
        team = current_user.teams.create(params[:team])
        redirect "/teams/#{team.id}"
    end  

    get '/teams/:id' do
        permission_required
        @team = current_user.teams.find_by_id(params[:id])
        erb :"teams/show"
    end 

    get '/teams/:id/edit' do
        permission_required
        @team = current_user.teams.find_by_id(params[:id])
        erb :"teams/edit"
    end 
    
    patch '/teams/:id' do
        permission_required
        sanitize_input(params[:team])
        team = current_user.teams.find_by_id(params[:id])
        team.update(params[:team])
        redirect "teams/#{team.id}"
    end 
    
    delete '/teams/:id' do
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