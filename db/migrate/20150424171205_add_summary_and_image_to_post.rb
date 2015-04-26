class AddSummaryAndImageToPost < ActiveRecord::Migration
  def change
    add_column :posts, :summary, :text
    add_column :posts, :post_img, :string
  end
end
