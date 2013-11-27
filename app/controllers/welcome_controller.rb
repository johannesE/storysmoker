class WelcomeController < ApplicationController
  def index
    @stories = Story.all
    @tags = Story.all.tag_counts_on(:tags)
  end
end
