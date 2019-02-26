class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.references :category, foreign_key: true
      t.references :performance_date, foreign_key: true
      t.references :profile, foreign_key: true
      t.string :title
      t.text :description
      t.string :image_url
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
