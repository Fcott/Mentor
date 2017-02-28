class PagesController < ApplicationController
  before_action :authenticate_user!, only: :for_you

  def home
    @stories = Story.all.published.order_by_published
    @jobs_lists = JobCategory.first(4)
  end

  def for_you
    followings = current_user.followings
    @stories = Story.where(user: followings).published.order_by_published
    @jobs_lists = JobCategory.first(4)
    render 'home'
  end
end
