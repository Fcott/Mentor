class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build(story_params)
    if @story.save
      flash[:success] = "Successfully created"
      redirect_to root_url
    else
      # @feed_items = []
      render 'new'
    end
  end

  def edit
    @story = Story.find_by(params[:id])
  end

  def update
    @story = Story.find_by(params[:id])
    if @story.update(story_params)
      flash[:success] = "Successfully updated"
      redirect_to story_path(@story)
    else
      # @feed_items = []
      render 'edit'
    end
  end

  def destroy
    @story = Story.find_by(params[:id])
    user = @story.user
    if @story.destroy
      flash[:success] = "Successfully deleted"
      redirect_to root_url
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :content, :cover_image)
  end

  def correct_user
    @story = current_user.stories.find_by(id: params[:id])
    redirect_to root_url if @story.nil?
  end
end
