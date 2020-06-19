class EquipmentsController < ApplicationController
   
       get '/equipments' do
           @equipments = Equipment.all
            erb :"/equipments/index"
       end
   
       get '/equipments/new' do
           @equipments = Equipment.all
           @teams = Team.all
           erb :"equipments/new"
           
       end
   
       post '/equipments' do
        
           equipment = Equipment.find_or_create_by(params[:equipment])
           character = Character.find_or_create_by(params[:character])
           teams = Team.find(params[:teams])
       
           equipment.character = character
           equipment.teams << teams
           equipment.save
       
        #  flash[:message] = "Successfully created equipment."
           redirect to "/equipments/#{equipment.slug}"
       end
   
       get '/equipments/:slug' do
        @equipment = Equipment.find_by_slug(params[:slug])
        erb :"/equipments/show"
      end
    
      get '/equipments/:slug/edit' do
        @equipment = Equipment.find_by_slug(params[:slug])
        @teams = Team.all
        erb :"/equipments/edit"
      end 
    
      patch '/equipments/:slug' do 
        equipment = Equipment.find_by_slug(params[:slug])
        equipment.update(params[:equipment])
        equipment.teams = Team.find(params[:teams])
    
        unless params[:equipment][:name].empty?
          equipment.character = Character.find_or_create_by(params[:character])
          equipment.save
        end 
    
        # flash[:message] = "Successfully updated equipment."
        redirect to "/equipments/#{equipment.slug}"
      end

      delete '/equipments/:id' do
        @equipment = Equipment.find_by_slug(params[:slug])
        @equipment.destroy
        redirect "equipments"
    end 
   
   
   end