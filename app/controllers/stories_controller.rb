class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  include StatusHelper

<<<<<<< HEAD

  def like
    @current_user = User.first
    @story = Story.find(params[:id])

    if @current_user.flagged?(@story, :like)
          #we already like this
      @current_user.unflag(@story, :like)
      msg = "You now don't like this article"
        else
          # we don't like this yet
          @current_user.flag(@story, :like)
          msg = "You now like this article"

        end

    redirect_to stories_path, :notice => msg

  end

=======
>>>>>>> FETCH_HEAD
  # GET /stories
  # GET /stories.json
  def index
    @current_user = User.first
    @stories = Story.all
    #unlockDB
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
<<<<<<< HEAD


=======
    @sortSnippets = @story.snippets.sort_by &:created_at
>>>>>>> FETCH_HEAD
  end

  # GET /stories/new
  def new
    @story = Story.new
    @snippets = @story.snippets.new

  end

  # GET /stories/1/edit
  def edit
    #@sortSnippets = @story.snippets.sort_by &:created_at  
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save

        @snippet = @story.snippets.create(params[:story][:snippet].permit(:content))

        format.html { redirect_to root_path, notice: 'Story was successfully created.' }
        #format.html { redirect_to @story, notice: 'Story was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  #admin mode
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_path, notice: 'Story was successfully deleted.' }
    end
  end


  def findByTag
    if params[:tag].present?
      @stories = Story.tagged_with(params[:tag])
    else
      @stories = Story.all
    end
    render 'stories/index'
  end
  
  def setStatusAsEditable
   Story.find(params[:id]).update_attribute(:status, 'editable')
   redirect_to stories_path
  end
  

  def unlock_all
    Story.all.each do |s|
      if s.status == 'locked'
      s.update_attribute(:status, 'editable')
      end
    end
    redirect_to stories_path
    return
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:title, :status, :tag_list, :size)
  end

end
