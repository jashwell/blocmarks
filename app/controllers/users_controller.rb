class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_bookmarks = current_user.bookmarks
    @bookmarks = @user.bookmarks
    @liked_bookmarks = current_user.likes.map(&:bookmark)
  end

end


