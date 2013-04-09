Listopia
============

A better way to manage lists in Rails apps.

Prerequisites
============

Any model you plan on adding to a list requires the `list_count` column until I can figure out a way to have an optional `counter_cache`.

Installation
============

Gemfile
------------

	gem "listopia", :path => "/path/to/listopia"
	gem "haml"
	gem 'chosen-rails'
	gem 'jquery-ui-rails'

application.js
------------

First, create scaffold.js.coffee

	$ ->
	  # enable chosen js
	  $('.chzn-select').chosen
	    allow_single_deselect: true
	    no_results_text: 'No results matched'

Then your application.js should read:

	//= require jquery
	//= require jquery_ujs
	//= require jquery.ui.all
	//= require chosen-jquery
	//= require scaffold
	//= require listopia/sortable
	//= require listopia/callbacks
	

application.css
------------

	*= require_self
	*= require chosen
	*= require jquery.ui.all


Generators / Migrations
------------

	$ bundle exec rails g listopia install
	$ bundle exec rails g listopia:views views
	$ rake listopia_engine:install:migrations
	$ rake db:migrate
	
Example Model to add to Lists
------------

    $ rails g model Product name:string list_count:integer
    $ rake db:migrate
    $ rails c
    > Product.create(:name => "Huggies")
    > Product.create(:name => "Pampers")`  

Customize the views
-------------

Change the commented section in app/views/listopia/lists/show.html.haml to:

  `%h2 Add to your list
  = form_for ListItem.new do |f|
    = f.select :resource_id, Product.all.map { |u| [u.name, u.id] }, { include_blank: true }, { class: 'chzn-select', style: "width: 300px;" }
    = f.hidden_field :resource_type, :value => "Product"
    = f.hidden_field :list_id, :value => @list.id
    %br
    = f.submit "Save"`

Usage
-----------

1. Start your app server and visit: `http://host/lists/new`
2. Create a new list
3. Add some stuff to the list
4. Reorder
5. Remove

You have some list functions! Yay!