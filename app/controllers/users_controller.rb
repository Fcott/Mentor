class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @own_stories = @user.stories
  end
end
