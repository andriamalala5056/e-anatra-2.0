class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters do |t|
      t.string :lastname
      t.string :firstname
      t.string :email

      t.timestamps
    end
  end
end
