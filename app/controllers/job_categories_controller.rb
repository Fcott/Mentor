class JobCategoriesController < ApplicationController
  def show
    @job_category = JobCategory.find(params[:id])
    @subcategories = @job_category.subcategories
    job_ids = @subcategories.map(&:id).unshift(@job_category.id)
    users = UserJob.users_of(job_ids)
    @job_stories = Story.where(user: users).published.order_by_published
  end
end
