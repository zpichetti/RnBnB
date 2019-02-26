class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :address_zipcode
      t.string :address_city
      t.string :address_country
      t.string :performer_description
      t.references :user, foreign_key: true
      t.string :avatar_url

      t.timestamps
    end
  end
end
