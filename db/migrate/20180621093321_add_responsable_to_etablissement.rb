class AddResponsableToEtablissement < ActiveRecord::Migration[5.2]
  def change
    add_reference :etablissements, :role, foreign_key: true
  end
end
