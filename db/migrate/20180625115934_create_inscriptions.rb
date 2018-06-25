class CreateInscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :inscriptions do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :etab, foreign_key: true
      t.belongs_to :vague, foreign_key: true
      t.belongs_to :filiere, foreign_key: true
      t.belongs_to :niveau, foreign_key: true
      t.boolean :valide, default: false # tant que le responsable n'en valide pas
      t.boolean :delai, default: true #jusqu'au prochainne rentree
      t.text :description

      t.timestamps
    end
  end
end
