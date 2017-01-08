class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @own_stories = @user.stories
  end

  def editing_stories
    @user = User.find(params[:user_id])
  end

  def saved_stories
    @user = User.find(params[:user_id])
    @saved_stories = @user.saved_stories
  end
end
