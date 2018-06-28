class AddColumnProvinceInscription < ActiveRecord::Migration[5.2]
  def change
    add_reference :inscriptions, :province, foreign_key: true
  end
end
