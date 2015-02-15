class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_oken, only: [:create]

  def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here.
     # Find the user by using params[:sender]
     @user = User.find(params[:sender])

     # Find the topic by using params[:subject]
     @topic = Topic.find(params[:subject])

     # Assign the url to a variable after retreiving it from params["body-plain"]
     @url = 'body-plain'

     # Check if user is nil, if so, create and save a new user
     @user = User.create if @user.nil?

     # Check if the topic is nil, if so, create and save a new topic
     @topic = Topic.create if @topic.nil

     # Now that we're sure we have a valid user and topic, build and save a new bookmark
     @bookmark = Bookmark.create

    

    head 200
  end
end
