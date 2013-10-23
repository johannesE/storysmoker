class SnippetsController < ApplicationController


  def create
   @story = Story.find(params[:story_id])
   @snippet = @story.snippets.create(params[:snippet].permit(:content))
	redirect_to story_path(@story)
  end
 
  def destroy
   @story = Story.find(params[:story_id])
   @snippet = @story.snippets.find(params[:id])
   @snippet.destroy
   redirect_to story_path(@story)
  end



end
