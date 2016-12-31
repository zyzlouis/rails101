class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end

  def edit
    find_post_and_check_permission
  end

  def find_post_and_check_permission
    @post = Post.find(params[:id])

    if current_user != @group.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Post deleted"
    redirect_to posts_path
  end
end
