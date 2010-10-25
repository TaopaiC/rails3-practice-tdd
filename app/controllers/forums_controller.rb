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
    find_forum
    redirect_to forum_posts_path(@forum)
  end

  def edit
    find_forum
  end

  def update
    find_forum
    if @forum.update_attributes(params[:forum])
      redirect_to forum_posts_path(@forum)
    else
      render :edit
    end
  end

  def destroy
    find_forum
    @forum.destroy
    redirect_to forums_path
  end

  protected
  def find_forum
    @forum = Forum.find(params[:id])
  end
end
