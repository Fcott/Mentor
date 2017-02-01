class PagesController < ApplicationController
  def home
    @stories = Story.all.published.order_by_published
    @jobs_lists = JobCategory.first(4)
  end
end
