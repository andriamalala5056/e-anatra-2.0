class AddProvinceToEtabs < ActiveRecord::Migration[5.2]
  def change
    add_reference :etabs, :province, foreign_key: true
  end
end
