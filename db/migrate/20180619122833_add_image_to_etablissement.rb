class AddImageToEtablissement < ActiveRecord::Migration[5.2]
  def change
  	add_column :etablissements, :image, :string
  end
end
