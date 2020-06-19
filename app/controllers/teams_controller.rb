class TeamsController < ApplicationController
    # before do 
    #     login_required
    # end
 #7 restful routes 
 #Create, Read, Update, Delete

    get '/teams' do
        @teams = Team.all
         erb :"teams/index"
    end

    get '/teams/new' do
        @teams = Team.all
        erb :"teams/new"
    end

    post '/teams' do
        team = current_user.teams.create(params[:team])
        redirect "/teams/#{params[:id]}"
    end  

    get '/teams/:id' do
        @team = Team.find(params[:id])
        erb :"teams/show"
    end 

    get '/teams/:id/edit' do
        @team = Team.find(params[:id])
        erb :"teams/edit"
    end 
    
    patch '/teams/:id' do
        Team.find(params[:id]).update(params[:team])
        redirect "teams/#{params[:id]}"
    end 
    
    delete '/teams/:id' do
        @team = Team.find(params[:id])
        @team.destroy
        redirect "teams"
    end 
        


end