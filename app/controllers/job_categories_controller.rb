class JobCategoriesController < ApplicationController
  def show
    @job_category = JobCategory.find(params[:id])
    @job_stories = Story.all
    @subcategories = @job_category.subcategories
  end
end
