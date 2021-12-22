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
  end

  def update
  end

  def destroy
  end

  private

  def post_image_params
    params.require(:post_image).permit(:body, :image)
  end

end
