class TeamsController < ApplicationController
 #7 restful routes 
 #Create, Read, Update, Delete

    get '/teams' do
        @teams - Team.all
         erb :"teams/index"
    end

    get '/teams/new' do
        @teams = Team.all
        erb :"teams/new"
        
    end
    
    get '/teams/:id' do
        @team = Team.find(params[:id])
        erb :"teams/show"
    end 

    post '/teams' do
        team = Team.create(params)
        redirect "/teams/#{Team.id}"
    end 

    get '/teams/:id/edit' do
        @team = Team.find(params[:id])
        erb :"teams/edit"
    end 
    
    patch '/teams/:id' do
        Team.find(params[:id]).update(name: params[:name], description: params[:description])
        redirect "teams/#{params[:id]}"
    end 
    
    delete '/teams/:id' do
        @team = Team.find(params[:id])
        @team.destroy
        redirect "teams"
    end 
        


end