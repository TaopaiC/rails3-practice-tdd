# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  forum_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_posts_on_forum_id  (forum_id)
#

require 'spec_helper'

describe Post do
  pending "is valid with params"
  pending "is invalid without title"
  pending "is invalid without description"
  pending "is invalid without forum_id"
end
