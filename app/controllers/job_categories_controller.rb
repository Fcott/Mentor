class JobCategoriesController < ApplicationController
  def show
    @job_category = JobCategory.find(params[:id])
    @users  = @job_category.users
    # @job_stories = @users.flat_map(&:stories)
    @job_stories = Story.where(user: @users).published
    @subcategories = @job_category.subcategories
  end
end
