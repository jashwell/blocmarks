class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_oken, only: [:create]

  def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here.
     # Find the user by using params[:sender]
     user = params[:sender]

     # Find the topic by using params[:subject]
     title = params[:subject]

     # Assign the url to a variable after retreiving it from params["body-plain"]
     url = params["body-plain"]


     # Check if user is nil, if so, create and save a new user
     user = User.where(email: email).first
     user ||= user.new(email: email)
     user.save


     # Check if the topic is nil, if so, create and save a new topic
     topic = Topic.where(title: title, user_id: user.id).first
     topic ||= user.topics.new(title: title)
     topic.save


     # Now that we're sure we have a valid user and topic, build and save a new bookmark
     bookmark = topic.bookmarks.new(url: url)
     bookmark.save

    

    head 200
  end
end
