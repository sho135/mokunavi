class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @post = Posts.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :text, :image_id)
  end

end
