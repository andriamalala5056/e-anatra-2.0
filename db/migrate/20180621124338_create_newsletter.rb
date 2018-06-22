class CreateNewsletter < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters do |t|
      t.string :email
      t.boolean :status, :default => false
    end
  end
end
