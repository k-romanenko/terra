class AddLockVersionToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :lock_version, :integer, null: false
  end
end
