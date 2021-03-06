class ForumsController < ApplicationController
  before_filter :find_forum, :only => [:show, :edit, :update, :destroy]

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
    redirect_to forum_posts_path(@forum)
  end

  def edit
  end

  def update
    if @forum.update_attributes(params[:forum])
      redirect_to forum_posts_path(@forum)
    else
      render :edit
    end
  end

  def destroy
    @forum.destroy
    redirect_to forums_path
  end

  protected
  def find_forum
    @forum = Forum.find(params[:id])
  end
end
