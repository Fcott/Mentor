class PagesController < ApplicationController
  def home
    @stories = Story.published
  end
end
