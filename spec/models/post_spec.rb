# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  blog_id    :integer
#  title      :string
#  body       :text
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  summary    :text
#  post_img   :string
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
