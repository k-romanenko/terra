class AddRatingSumAndRatingCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :rating_sum, :integer, default: 0, null: false
    add_column :posts, :rating_count, :integer, default: 0, null: false
  end
end
