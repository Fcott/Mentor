class JobCategoriesController < ApplicationController
  def show
    @job_category = JobCategory.find(params[:id])
  end
end
