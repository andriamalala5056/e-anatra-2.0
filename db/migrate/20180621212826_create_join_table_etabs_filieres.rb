class CreateJoinTableEtabsFilieres < ActiveRecord::Migration[5.2]
  def change
    create_join_table :etabs, :filieres do |t|
       t.index [:etab_id, :filiere_id]
       t.index [:filiere_id, :etab_id]
    end
  end
end
