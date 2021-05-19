class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :slug
      t.string :link
      t.datetime :published
      t.string :status

      t.timestamps
    end
  end
end
