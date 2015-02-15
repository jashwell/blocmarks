class BookmarksController < ApplicationController
  respond_to :html, :js

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark Saved"
      redirect_to @topic
    else
      flash[:error] = "There was an error saving your bookmark."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update_attributes(bookmark_params)
      redirect_to @bookmark.topic
    else
      flash[:error] = "Error saving bookmark."
      render :edit
    end
  end


  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted succcessfully."
      redirect_to @bookmark.topic
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
