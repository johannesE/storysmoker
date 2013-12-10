class WelcomeController < ApplicationController
 include StatusHelper
  def index
    @stories = Story.all
    @tags = Story.all.tag_counts_on(:tags)
	
	unlockDB

  end
  

   def refresh
    render :partial => "welcome/dynamic"
   end

  
end
