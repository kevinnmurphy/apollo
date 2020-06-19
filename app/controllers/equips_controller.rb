class EquipsController < ApplicationController
  # before do 
  #   login_required
  # end 

  get '/equips' do
      @equips = Equip.all
      erb :"/equips/index"
  end

  get '/equips/new' do
      @equips = Equip.all
      @teams = Team.all
      erb :"equips/new"
      
  end

  post '/equips' do
    equip = Equip.find_or_create_by(params[:equip])
    # character = Character.find_or_create_by(params[:character])
    # teams = Team.find(params[:teams])

    # equip.artist = artist
    # equip.genres << genres
    # equip.save
  
    # flash[:message] = "Successfully created equip."
      redirect to "/equips/#{equip.id}"
    end

    get '/equips/:id' do
    @equip = Equip.find_by_id(params[:id])
    erb :"/equips/show"
  end

  get '/equips/:id/edit' do
    @equip = Equip.find_by_id(params[:id])
    @teams = Team.all
    erb :"/equips/edit"
  end 

  patch '/equips/:id' do 
    equip = Equip.find_by_id(params[:id])
    equip.update(params[:equip])
    equip.teams = Team.find(params[:teams])

    unless params[:equip][:name].empty?
      equip.character = Character.find_or_create_by(params[:character])
      equip.save
    end 

    # flash[:message] = "Successfully updated equip."
    redirect to "/equips/#{equip.id}"
  end

  delete '/equips/:id' do
    @equip = Equip.find_by_id(params[:id])
    @equip.destroy
    redirect "equips"
  end 


end