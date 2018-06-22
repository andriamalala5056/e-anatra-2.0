class CreateJoinTableFilieresNiveaus < ActiveRecord::Migration[5.2]
  def change
    create_join_table :filieres, :niveaus do |t|
       t.index [:filiere_id, :niveau_id]
       t.index [:niveau_id, :filiere_id]
    end
  end
end
