class AddColumnEtabToFilieres < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :etab, foreign_key: true
  end
end
