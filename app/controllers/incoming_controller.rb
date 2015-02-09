class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_oken, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    

    head 200
  end
end
