class SavesController < ApplicationController
  before_action :authenticate_user!

  def create
    @story = Story.find(params[:id])
    current_user.save_story!(@story)
  end

  def destroy
    @story = Save.find(params[:id]).story
    current_user.unsaved!(@story)
  end
end
