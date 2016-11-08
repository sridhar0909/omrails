class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @tweets = @user.tweets
    @stories = @user.stories
  end
end
