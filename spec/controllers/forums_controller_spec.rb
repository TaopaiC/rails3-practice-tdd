require 'spec_helper'

describe ForumsController do
  describe "GET index" do
    it "returns all forums" do
      @forums = [ mock_model(Forum) ]
      Forum.stub(:all) { @forum }

      get :index

      assigns(:forums).should eq( @forum )
      response.should render_template("index")
    end
  end

  pending "GET show"

  describe "GET new" do
    it "returns a new forum form" do
      @forum = mock_model(Forum)
      Forum.should_receive(:new).and_return(@forum)

      get :new

      assigns(:forum).should eq(@forum)
      response.should render_template("new")
    end
  end

  pending "POST create"

  pending "GET edit"

  pending "PUT update"

  pending "DELETE destroy"
end
