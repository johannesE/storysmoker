class SnippetsController < ApplicationController

  #before_filter :authenticate, :except => [:index, :show] FIXME .........................


  def index
   @story = Story.find(params[:story_id])
   @snippets = @story.snippets
   #redirect_to root_path
   
  end

  def new
   #redirect_to root_path
   @story = Story.find(params[:story_id])
   @snippets = @story.snippets.new

=begin   
   #via url?
   if  Story.find(params[:story_id]).status == 'locked'
    respond_to do |format|
     format.html { redirect_to root_path, notice: "You can't do that, sorry!" }
	end
   end
=end   
   
   #Here, we 'lock' the database
   #finished: means that the story is finished
   #editable: means that the story is editable
   #locked: means that the story is locked (someone is editing it)
   
   Story.find(params[:story_id]).update_attribute(:status, 'locked')
   session[:current_story_id] = params[:story_id]
      
  end

  
  
  def create
   
   #Now, we can unlock the database
   Story.find(params[:story_id]).update_attribute(:status, 'editable')

   @tag = @story

   respond_to do |format|
      if params[:snippet][:content].present?
	     @story = Story.find(params[:story_id])
         @snippet = @story.snippets.create(params[:snippet].permit(:content))
       params = @params.merge(params[:snippet][:story].permit(:tag_list))
		   @story = Story.update(@story.title, @story.status, params[:snippet][:story].permit(:tag_list), @story.size)

		 #If the story is finished
		 if @story.snippets.count == @story.size
	      Story.find(params[:story_id]).update_attribute(:status, 'finished')
		 end
		 
	    format.html { redirect_to root_path, notice: 'Snippet was successfully created!' }
      end
	end  

  end


end
