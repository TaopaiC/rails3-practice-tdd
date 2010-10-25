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

  pending "GET new"

  pending "POST create"

  pending "GET edit"

  pending "PUT update"

  pending "DELETE destroy"
end
