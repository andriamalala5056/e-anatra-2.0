class CreateTableNiveaus < ActiveRecord::Migration[5.2]
  def change
    create_table :niveaus do |t|
      t.string :niveau
    end
  end
end
