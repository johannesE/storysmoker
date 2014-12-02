class WelcomeController < ApplicationController
  include StatusHelper

  def index
    @stories = Story.all
    @tags = Story.all.tag_counts_on(:tags)

    if @stories.where(status: 'finished').any?
      @randomStory = Story.where(status: 'finished').offset(rand(Story.where(status: 'finished').count)).first.snippets.sort_by &:created_at
    else
      @randomStory = nil
    end
    


    #unlockDB

  end


  def refresh
    render :partial => "welcome/dynamic"
  end


end
