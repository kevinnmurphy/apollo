class CharactersController < ApplicationController
 #7 restful routes 
 #Create, Read, Update, Delete

    get '/characters' do
        @characters - Character.all
         erb :"characters/index"
    end

    get '/characters/new' do
        @teams = Team.all
        @characters = Character.all
        erb :"characters/new"
        
    end
    
    get '/characters/:id' do
        @character = Character.find(params[:id])
        erb :"characters/show"
    end 

    post '/characters' do
        binding.pry
        @team = Team.create(params[:team])
        # if !params[:character].empty?
        #     @team.characters << Character.create(params[:character])
        # end
        character = Character.create(params[:character])
        redirect "/characters/#{character.id}"
    end

    get '/characters/:id/edit' do
        @character = Character.find(params[:id])
        erb :"characters/edit"
    end 
    
    patch '/characters/:id' do
        Character.find(params[:id]).update(params[:character])
        redirect "characters/#{params[:id]}"
    end 
    
    delete '/characters/:id' do
        @character = Character.find(params[:id])
        @character.destroy
        redirect "characters"
    end 
        


end