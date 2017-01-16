class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @own_stories = @user.stories.published
  end

  def drafts
    @user = User.find(params[:user_id])
    @drafts = @user.stories.drafts
  end

  def saved
    @user = User.find(params[:user_id])
    @saved_stories = @user.saved_stories.saved_order
  end
end
