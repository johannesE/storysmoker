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
   
   #Here, we 'lock' the database - a bit hacky but...
   #finished: means that the story is finished
   #editable: means that the story is editable
   #locked: means that the story is locked (someone is editing it)
   
   #@story.update_attribute(:status, 'l') FIXME
   
   
  end
#FIXME -------
  
  
  def create
   @story = Story.find(params[:story_id])
   @snippet = @story.snippets.create(params[:snippet].permit(:content))
   #redirect_to story_path(@story)
   
   #Now, we can unlock the database
   #@story.update_attribute(:status, 'e')

   
   redirect_to root_path
  end



end
