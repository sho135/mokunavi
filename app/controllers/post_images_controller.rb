class PostImagesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @post_image = PostImage.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post_image = PostImage.new(post_image_params)
    @post_image.post_id = @post.id
    @post_image.save
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
  end

  private

  def post_image_params
    params.require(:post_image).permit(:text, :image)
  end

end
