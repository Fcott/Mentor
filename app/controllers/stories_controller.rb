class StoriesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :correct_user, only: [:destroy]

  def show
    @story = Story.find(params[:id])
    if @story.draft && current_user != @story.user
      redirect_to root_url
    end
  end

  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build(story_params)

    respond_to do |format|
      if @story.save
        if params[:draft]
          @story.as_draft
          flash[:success] = "Saved as draft"
        elsif params[:publish]
          @story.publish
          flash[:success] = "Successfully posted"
        end
        format.html { redirect_to root_url }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      if params[:draft]
        @story.as_draft
        flash[:success] = "Kept as draft"
      elsif params[:publish]
        @story.publish
        flash[:success] = "Successfully Updated"
      end
      flash[:success] = "Successfully updated"
      redirect_to story_path(@story)
    else
      # @feed_items = []
      render 'edit'
    end
  end

  def destroy
    @story = Story.find(params[:id])
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
