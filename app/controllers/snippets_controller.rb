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
   #0 means that the story is finished
   #1 means that the story is editable
   #2 means that the story is locked (someone is editing it)
   
   @story.update_attribute(:editable, '2')
   
   
  end
#FIXME -------
  
  
  def create
   @story = Story.find(params[:story_id])
   @snippet = @story.snippets.create(params[:snippet].permit(:content))
   #redirect_to story_path(@story)
   
   #Now, we can unlock the database
   @story.update_attribute(:editable, '1')

   
   redirect_to root_path
  end



end
