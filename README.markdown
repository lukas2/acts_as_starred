Acts As Starred
===============

Just a simple plugin that allows users to "star" an item, for example a blog-post, as is known from GMail.

To install run:

    rails generate starred
    rake db:migrate

And add the following in your model:
  
    class Post < ActiveRecord::Base
      acts_as_starred
      ..
    end

Your model-instances will then have the methods

    def star!(user)
    def unstar!(user)

..that you can use in your controllers to set and unset stars for items and users.


This plugin requires that a model "User" exists.
