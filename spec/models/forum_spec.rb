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
  it "is valid with params" do
    @params = {:title => Faker::Lorem.sentence}
    Forum.new(@params).should be_valid
  end

  it "is invalid without title" do
    @params = {}
    Forum.new(@params).should_not be_valid
  end
end
