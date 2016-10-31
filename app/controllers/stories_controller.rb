class StoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  def index
    @stories = Story.all
  end

  # GET /stories/1
  def show
    @story = Story.find(params[:id])
  end

  # GET /stories/new
  def new
    @story = current_user.stories.new
  end

  # GET /stories/1/edit
  def edit
    @story = current_user.stories.find(params[:id])
  end

  # POST /stories
  def create
    @story = current_user.stories.new(story_params)
      if @story.save
        redirect_to @story, notice: 'Story was successfully created.'
      else
        render :new 
      end
  end

  # PATCH/PUT /stories/1
  def update
    @story = current_user.stories.find(params[:id])
      if @story.update(story_params)
        redirect_to @story, notice: 'Story was successfully updated.' 
      else
      render :edit 
      end
  end

  # DELETE /stories/1
  def destroy
    @story = current_user.stories.find(params[:id])
    @story.destroy
    redirect_to stories_url, notice: 'Story was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:user_id, :date, :title, :story)
    end
end 
