class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
  end

  def index
    @user = current_user
    @users = User.all
    @posts = Post.all


  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :text, :image_id)
  end

end
