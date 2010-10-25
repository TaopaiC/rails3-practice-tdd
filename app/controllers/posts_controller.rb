class PostsController < ApplicationController
  protected
  def find_forum
    @forum = Forum.find(params[:forum_id])
  end

  def find_post
    @post = @forum.posts.find(params[:id])
  end
end
