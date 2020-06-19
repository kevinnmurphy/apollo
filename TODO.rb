
#secure inputs to prevent attacks
attack
    <script>alert(‘Injected!’);</script>
validate inputs to prevent injections
    .gsub(/[\<\>\/]/, "")

# Put login logout burger in the header bar
    <div>
    <% if logged_in?%>
      <h2>You are logged in <%= current_user.name %></h2>
      <a href="/logout">Log out.</a>
    <% else%>
      <%= <a href="/sessions/login">Login</a> %>
      <%= <a href="/users/new">SignUp</a> %>
    <% end%>
  </div>

  #table for teams/show
  <h4>Team Members:</h4>
<ul>
  <%@team.characters.each do |member|%>
  <li><%=member.name%></li>
  <%end%>
</ul>

#Slugify
post '/equipments' do
    binding.pry
      equipment = Equipment.find_or_create_by(params[:equipment])
      # character = Character.find_or_create_by(params[:character])
      # teams = Team.find(params[:teams])
  
      # equipment.artist = artist
      # equipment.genres << genres
      # equipment.save
   
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

#check sanitize input helper