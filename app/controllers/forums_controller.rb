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

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
    @forum = Forum.find(params[:id])
    if @forum.update_attributes(params[:forum])
      redirect_to forum_posts_path(@forum)
    else
      render :edit
    end
  end

end
