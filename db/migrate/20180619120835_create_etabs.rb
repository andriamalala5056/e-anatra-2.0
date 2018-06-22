class CreateEtabs < ActiveRecord::Migration[5.2]
  def change
    create_table :etabs do |t|
      t.string :nom_etab
      t.string :email
      t.string :phone_number
      t.string :address
      t.text :description
      t.string :category
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
