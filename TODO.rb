
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