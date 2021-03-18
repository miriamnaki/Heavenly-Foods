# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

//this raises an error when the user logs in
* <% if current_user %>
      <li>
        <i class="fa fa-shopping-cart"></i>
        <span> <%= current_user.shopping_cart_items_count%></span>
      </li>

      category snack causes an error when clicked



      <%# <% if can? :crud,item %> %>
        <%# <%= link_to("DELETE", menu_item_path(item),method: :delete, data:{confrim:'Delete item?'},class:'menu_item_delete')%> %>
        <%# <%end%> %>

        <%# <% if can? :crud,item %> %>
        <%# <%= link_to("EDIT", edit_menu_item_path(item),class:'menu_item_delete')%> %>
        <%# <%end%> %>

        <li class="nav-item">
        <%= link_to "NEW MENU ITEM", new_menu_item_path, class:"nav-link" %>
       </li>  
       <li class="nav-item">
         <%= link_to "NEW MENU TYPE", new_menutype_path, class:"nav-link" %>
        </li>  
      <% end %>
