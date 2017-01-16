class SavesController < ApplicationController
  before_action :authenticate_user!

  def create
    @story = Story.find(params[:story_id])
    current_user.save!(@story)
    @story.saved
  end

  def destroy
    @story = Save.find(params[:id]).story
    current_user.unsave!(@story)
    @story.unsaved
  end
end
