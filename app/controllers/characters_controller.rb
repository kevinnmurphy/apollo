class CharactersController < ApplicationController
 #7 restful routes 
 #Create, Read, Update, Delete

    get '/characters' do
        @characters - Character.all
         erb :"characters/index"
    end

    get '/characters/new' do
        @characters = Character.all
        erb :"characters/new"
        
    end
    
    get '/characters/:id' do
        @character = Character.find(params[:id])
        erb :"characters/show"
    end 

    post '/characters' do
        character = Character.create(params)
        redirect "/characters/#{character.id}"
    end 

    get '/characters/:id/edit' do
        @character = Character.find(params[:id])
        erb :"characters/edit"
    end 
    
    patch '/characters/:id' do
        Character.find(params[:id]).update(title: params[:title], content: params[:content])
        redirect "characters/#{params[:id]}"
    end 
    
    delete '/characters/:id' do
        @character = Character.find(params[:id])
        @character.destroy
        redirect "characters"
    end 
        


end