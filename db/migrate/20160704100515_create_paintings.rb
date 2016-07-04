class CreatePaintings < ActiveRecord::Migration[5.0]
  def change
    create_table :paintings do |t|
      t.string :title
      t.references :gallery, foreign_key: true
      t.attachment :image
      t.boolean :primary, default: false

      t.timestamps
    end
  end
end
