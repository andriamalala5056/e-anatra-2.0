class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :sex, :string, null: false, default: ""
    add_column :users, :birthday, :date, null: false
    add_column :users, :phone_number, :string, null: false, default: ""
    add_column :users, :address, :string, null: false, default: ""
  end
end
