class PagesController < ApplicationController
  def home
    @stories = Story.all.published
    @jobs_3 = JobCategory.first(3)
  end
end
