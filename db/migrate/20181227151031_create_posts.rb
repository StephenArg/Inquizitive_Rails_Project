class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
