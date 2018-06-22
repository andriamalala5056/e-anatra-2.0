class AddImageToEtab < ActiveRecord::Migration[5.2]
  def change
  	add_column :etabs, :image, :string
  end
end
