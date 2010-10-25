class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def new
    @forum = Forum.new
  end
end
