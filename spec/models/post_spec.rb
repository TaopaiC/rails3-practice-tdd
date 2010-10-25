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
  pending "add some examples to (or delete) #{__FILE__}"
end
