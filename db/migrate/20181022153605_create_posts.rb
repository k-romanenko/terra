class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :author_ip, null: false
      t.string :login, null: false
      t.references :user, foreign_key: true
      t.integer :rating_sum, default: 0, null: false
      t.integer :rating_count, default: 0, null: false
      t.decimal :rating_avg, default: 0, null: false
      t.integer :lock_version, null: false

      t.timestamps
    end

    add_index :posts, :rating_avg
    add_index :posts, %i[author_ip login]
  end
end
