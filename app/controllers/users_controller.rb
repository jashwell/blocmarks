class UsersController < ApplicationController

  
  def show
    @user = User.find(params[:id])
    bookmarks = Bookmark.find(params[:bookmark_id])
    @user_bookmarks = @current_user.bookmarks
  end
end
