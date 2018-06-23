class CreateTableFilieres < ActiveRecord::Migration[5.2]
  def change
    create_table :filieres do |t|
      t.string :filiere_name
    end
  end
end
