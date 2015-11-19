helpers do

<% if logged_in? %>
  <%= render :partial => "_header_in" %>
<% else %>
 <%= render :partial => "_header_out" %>
<% end %>

end