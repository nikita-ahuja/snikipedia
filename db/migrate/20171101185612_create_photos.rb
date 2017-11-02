class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :content_type
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
