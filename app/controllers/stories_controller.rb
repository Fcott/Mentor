class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def show
    @story = Story.find_by(params[:id])
  end

  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.create(story_params)
    if @story
      flash[:success] = "Successfully created"
      redirect_to root_url
    else
      # @feed_items = []
      render 'pages/home'
    end
  end

  def edit
    #code
  end

  def update
    #code
  end

  def delete
    #code
  end

  private
  def story_params
    params.require(:story).permit(:title, :content, :image)
  end

  def correct_user
    @story = current_user.stories.find_by(id: params[:id])
    redirect_to root_url if @story.nil?
  end
end
