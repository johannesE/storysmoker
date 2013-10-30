class SnippetsController < ApplicationController

  def index
   @story = Story.find(params[:story_id])
   @snippets = @story.snippets
   #redirect_to root_path
   
  end

#FIXME -------
  def new
   #redirect_to root_path
   @story = Story.find(params[:story_id])
   @snippets = @story.snippets.new
  end
#FIXME -------
  
  
  def create
   @story = Story.find(params[:story_id])
   @snippet = @story.snippets.create(params[:snippet].permit(:content))
	redirect_to story_path(@story)
  end



end
