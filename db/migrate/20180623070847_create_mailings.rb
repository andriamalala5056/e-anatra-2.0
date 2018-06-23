class CreateMailings < ActiveRecord::Migration[5.2]
  def change
    create_table :mailings do |t|
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
