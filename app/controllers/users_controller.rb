class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @own_stories = @user.own_story
  end
end
