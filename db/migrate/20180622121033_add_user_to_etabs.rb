class AddUserToEtabs < ActiveRecord::Migration[5.2]
  def change
    add_reference :etabs, :user, foreign_key: true
  end
end
