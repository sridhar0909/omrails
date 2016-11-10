class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
   story = Story.find(params[:id])
   story.liked_by current_user
   redirect_to stories_path, notice: "You liked this story :)"
  end

  def destroy
   story = Story.find(params[:id])
   story.unliked_by current_user
   redirect_to stories_path, notice: "You unliked this story :("
  end
end