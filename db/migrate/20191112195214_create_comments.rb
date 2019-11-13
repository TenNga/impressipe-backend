class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :rating
      t.string :image_url
      t.string :author

      t.timestamps
    end
  end
end
