class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Bookmark Liked"
      redirect_to @bookmark.topic
    else
      flash[:error] = "Can't like this."
      redirect_to @bookmark.topic
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Unliked!"
      redirect_to @bookmark.topic
    else
      flash[:error] = "This is staying liked."
      reidrect_to @bookmark.topic
    end
  end

end
