class CharactersController < ApplicationController

 #7 restful routes 
 #Create, Read, Update, Delete

    get '/characters' do
        @characters = current_user.characters.all
         erb :"characters/index"
    end

    get '/characters/new' do
        @teams = current_user.teams.all
        @characters = current_user.characters.all
        erb :"characters/new"
        
    end
    
    get '/characters/:id' do
        @character = current_user.characters.find(params[:id])
        erb :"characters/show"
    end 

    post '/characters' do
        sanitize_input(params[:character])
        @team = current_user.teams.create(params[:team])
        if !params[:character].empty?
            @team.characters << current_user.characters.create(params[:character])
        end
        character = current_user.characters.create(params[:character])
        # redirect "/characters/#{character.id}"
        redirect "/characters"
    end

    get '/characters/:id/edit' do
        @character = current_user.characters.find(params[:id])
        erb :"characters/edit"
    end 
    
    patch '/characters/:id' do
        sanitize_input(params[:character])
        character = current_user.characters.find(params[:id])
        character.update(params[:character])
        redirect "characters/#{params[:id]}"
    end 
    
    delete '/characters/:id' do
        @character = current_user.characters.find(params[:id])
        @character.destroy
        redirect "characters"
    end 
        

    private

    # def permission_required
    #   unless @character = current_user.characters.find_by(id: params[:id])
    #     flash[:alerts] = ["You don't have permission"]
    #     redirect to "/characters"
    #   end
    # end
  
    # def create_or_update_character
    #   unless @character.valid?
    #     flash[:alerts] = @character.errors.full_messages
    #   end
  
    #   unless params[:team][:title].empty?
    #     team = current_user.teams.find_or_create_by(params[:team])
    #     CharacterTeam.create(team_id: team.id, character_id: @character.id)
    #   end
      
    #   redirect to "/characters/#{@character.id}"
    # end

end