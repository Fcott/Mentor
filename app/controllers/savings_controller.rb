class SavingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @story = Story.find(params[:story_id])
    current_user.saving!(@story)
  end

  def destroy
    @story = Saving.find(params[:id]).story
    current_user.unsaving!(@story)
  end
end
