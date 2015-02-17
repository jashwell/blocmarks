class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Bookmark Liked"
      redirect_to @bookmark
    else
      flash[:error] = "Can't like this."
      redirect_to @bookmark
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "Unliked!"
      redirect_to @bookmark
    else
      flash[:error] = "This is staying liked."
      reidrect_to @bookmark
    end
  end

end
