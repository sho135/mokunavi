class HomesController < ApplicationController
  before_action :login_check

  def top
  end

  private

  def login_check
    redirect_to posts_path if user_signed_in?
  end
end
