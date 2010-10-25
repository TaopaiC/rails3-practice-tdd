# == Schema Information
#
# Table name: forums
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Forum do
  before(:each) do
    @params = {:title => Faker::Lorem.sentence}
  end

  it "is valid with params" do
    Forum.new(@params).should be_valid
  end

  it "is invalid without title" do
    Forum.new(@params.except(:title)).should_not be_valid
  end
end
