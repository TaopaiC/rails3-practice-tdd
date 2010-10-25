class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(params[:forum])
    if @forum.save
      redirect_to forum_posts_path(@forum)
    else
      render :new
    end
  end

  def show
    @forum = Forum.find(params[:id])
    redirect_to forum_posts_path(@forum)
  end
end
