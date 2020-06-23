class CharactersController < ApplicationController

    # before do
    #     login_required
    # end

    get '/characters' do
        login_required
        @characters = current_user.characters.all
         erb :"characters/index"
    end

    get '/characters/new' do
        login_required
        @teams = current_user.teams.all
        @characters = current_user.characters.all
        erb :"characters/new"
    end
    
    post '/characters' do

        login_required
        sanitize_input(params[:character])
        team = current_user.teams
        character = current_user.characters

        if !params[:character][:name].blank?
            character.create(params[:character])
            if !params[:team].empty?
                # team.find_or_create_by(params[:team])
                # team.characters << character
                # team.save
            end
        end

        #id is not working
        #redirect "/characters/#{character.id}"
        #{@character.id}
        redirect "/characters"
    end

    get '/characters/:id' do
        login_required
        permission_required
        @character = current_user.characters.find(params[:id])
        erb :"characters/show"
    end 

    get '/characters/:id/edit' do
        login_required
        permission_required
        @character = current_user.characters.find_by_id(params[:id])
        erb :"characters/edit"
    end 
    
    patch '/characters/:id' do
        login_required
        permission_required
        sanitize_input(params[:character])
        @team = current_user.teams.find_or_create_by(params[:team])
        character = current_user.characters.find_by_id(params[:id])
        # blank data protection
        # if @character.update(params[:character])
        #     redirect to "/characters"
        # else 
        #     redirect to "/characters/#{@character.id}/edit"
        # end

        if !params[:character][:name].blank?
            character.update(params[:character])  
            flash[:message] = "Successfully updated character."
        else 
            redirect to "/characters/#{character.id}/edit"
        end

        redirect to "/characters/#{character.id}"
    end 
    
    delete '/characters/:id' do
        login_required
        permission_required
        @character = current_user.characters.find(params[:id])
        @character.destroy
        redirect "characters"
    end 
        

    private

    def permission_required
      unless @character = current_user.characters.find_by(id: params[:id])
        flash[:alerts] = ["You don't have permission"]
        redirect to "/characters"
      end
    end
  
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