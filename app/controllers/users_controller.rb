class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:drafts, :saving]
  before_action :correct_user, only: [:drafts, :saving] 

  def show
    @user = User.find(params[:id])
    @own_stories = @user.stories.published
  end

  def drafts
    @user = User.find(params[:user_id])
    @drafts = @user.stories.drafts
  end

  def saving
    @user = User.find(params[:user_id])
    @saved_stories = @user.saved_stories
  end

  def profile
    @user = User.find(params[:user_id])
  end

  private
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to root_url unless current_user == @user
  end
end
