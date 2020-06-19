class EquipmentsController < ApplicationController
   
       get '/equipments' do
           @equipments - Equipment.all
            erb :"/equipments/index"
       end
   
       get '/equipments/new' do
           @equipments = Equipment.all
           @teams = Team.all
           erb :"equipments/new"
           
       end
   
       post '/equipments' do
        binding.pry
          equipment = Equipment.find_or_create_by(params[:equipment])
          # character = Character.find_or_create_by(params[:character])
          # teams = Team.find(params[:teams])
      
          # equipment.artist = artist
          # equipment.genres << genres
          # equipment.save
       
        #  flash[:message] = "Successfully created equipment."
           redirect to "/equipments/#{equipment.id}"
       end
   
       get '/equipments/:id' do
        @equipment = Equipment.find_by_id(params[:id])
        erb :"/equipments/show"
      end
    
      get '/equipments/:id/edit' do
        @equipment = Equipment.find_by_id(params[:id])
        @teams = Team.all
        erb :"/equipments/edit"
      end 
    
      patch '/equipments/:id' do 
        equipment = Equipment.find_by_id(params[:id])
        equipment.update(params[:equipment])
        equipment.teams = Team.find(params[:teams])
    
        unless params[:equipment][:name].empty?
          equipment.character = Character.find_or_create_by(params[:character])
          equipment.save
        end 
    
        # flash[:message] = "Successfully updated equipment."
        redirect to "/equipments/#{equipment.id}"
      end

      delete '/equipments/:id' do
        @equipment = Equipment.find_by_id(params[:id])
        @equipment.destroy
        redirect "equipments"
    end 
   
   
   end