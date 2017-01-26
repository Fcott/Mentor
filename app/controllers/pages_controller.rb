class PagesController < ApplicationController
  def home
    @stories = Story.published
    @jobs_3 = JobCategory.first(3)
  end
end
