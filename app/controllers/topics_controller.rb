class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))

    if @topic.save
      redirect_to @topic, notice: "Topic was added."
    else
      flash[:error] = "Error creating topic."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(params.require(:topic).permit(:title))
      redirect to @topic
    else
      flash[:error] = "Error saving topic."
      render :edit
    end
  end

end
