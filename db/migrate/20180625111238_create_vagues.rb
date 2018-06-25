class CreateVagues < ActiveRecord::Migration[5.2]
  def change
    create_table :vagues do |t|
      t.date :debut_session
      t.date :fin_session
      t.belongs_to :etab, foreign_key: true

      t.timestamps
    end
  end
end
