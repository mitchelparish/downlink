<!doctype html>
<html>
  <head>
    <title>Establishing downlink...</title>
  </head>
  <body>
    <h2>Login to establish your downlink:</h2>
    <form action="/login" method="POST">
      <input type="text" name="username" placeholder="Username">
      <input type="password" name="password" placeholder="Password">
      <input type="submit">
      </form>


</html>


<!doctype html>
<html>
  <head>
    <title>Establishing downlink...</title>
  </head>
  <body>
    <h1>Welcome to downlink.</h1>

      <a href="/signup">Create Account</a> |

      <% if logged_in? %>
        <a href="/users/<%=current_user.slug%>">Control Panel</a> |
        <a href="/logout">Logout</a>
      <% else %>
        <a href="/login">Sign In</a>
      <% end %>


</html>
