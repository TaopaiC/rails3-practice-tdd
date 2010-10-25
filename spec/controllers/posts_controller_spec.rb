require 'spec_helper'

describe PostsController do

  def should_find_forum
    @forum = mock_model(Forum)
    controller.should_receive(:find_forum) { controller.instance_variable_set("@forum", @forum) }.ordered
  end

  def should_find_post
    @post  = mock_model(Post)
    controller.should_receive(:find_post ) { controller.instance_variable_set("@post",  @post)  }.ordered
  end

  describe "before_filter" do
    it "find_forum returns requested forum" do
      @forum = mock_model(Forum)
      controller.params = {:forum_id => 4}

      Forum.should_receive(:find).with(4).and_return(@forum)
      controller.send(:find_forum)

      assigns(:forum).should eq(@forum)
    end

    it "find_post returns requested post" do
      @forum = mock_model(Forum)
      @post  = mock_model(Post)
      @posts = []
      controller.params = {:forum_id => 4, :id => 3}
      controller.instance_variable_set("@forum", @forum)
      @forum.should_receive(:posts).and_return(@posts)
      @posts.should_receive(:find).with(3).and_return(@post)

      controller.send(:find_post)

      assigns(:forum).should eq(@forum)
      assigns(:post ).should eq(@post)
    end
  end

  pending "GET index"

  describe "GET show" do
    it "returns requested post" do
      should_find_forum
      should_find_post

      get :show, :forum_id => 4, :id => 3

      assigns(:forum).should eq( @forum )
      assigns(:post ).should eq( @post  )
      response.should render_template("show")
    end
  end

  describe "GET new" do
    it "returns a new post form" do
      should_find_forum
      @post  = mock_model(Post)
      @posts = []
      @forum.should_receive(:posts).and_return(@posts)
      @posts.should_receive(:build).and_return(@post)

      get :new, :forum_id => 4

      assigns(:forum).should eq(@forum)
      assigns(:post ).should eq(@post)
      response.should render_template("new")
    end
  end

  describe "POST create" do
    before :each do
      should_find_forum
      @post  = mock_model(Post)
      @posts = []
      @params = { "title" => Faker::Lorem.sentence }

      @forum.stub!(:posts).and_return(@posts)
      @posts.should_receive(:build).with(@params).and_return(@post)
    end

    it "creates successfully" do
      @post.should_receive(:save).and_return(true)

      post :create, {:forum_id => 4, :post => @params}

      response.should redirect_to(forum_post_path(@forum, @post))
    end

    it "fails to create" do
      @post.should_receive(:save).and_return(false)

      post :create, {:forum_id => 4, :post => @params}

      assigns(:forum).should eq(@forum)
      assigns(:post ).should eq(@post)
      response.should render_template("new")
    end
  end

  pending "GET edit"
  pending "PUT update"
  pending "DELETE destroy"

end
