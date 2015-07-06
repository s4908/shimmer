class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :delivery_method, :string
    add_column :users, :delivery_address, :string
    add_column :users, :phone, :string
  end
end
