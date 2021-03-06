class TopicsController < ApplicationController
  respond_to :html, :js

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))
    @topic.user = current_user
    authorize @topic

    if @topic.save
      redirect_to @topic, notice: "Topic was added."
    else
      flash[:error] = "Error creating topic."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.update_attributes(params.require(:topic).permit(:title))
      redirect_to @topic
    else
      flash[:error] = "Error saving topic."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.destroy
      flash[:notice] = "Topic was deleted succcessfully."
      redirect_to action: "index"
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end


end
