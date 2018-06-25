class CreateEtabsFilieres < ActiveRecord::Migration[5.2]
  def change
    create_table :etabs_filieres do |t|

      t.belongs_to :filiere, foreign_key: true
      t.belongs_to :etab, foreign_key: true
      t.belongs_to :niveau, foreign_key: true
      t.integer :place

      t.timestamps
    end
  end
end
