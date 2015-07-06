class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_column :orders, :delivery_method, :string
    add_column :orders, :delivery_address, :string
    add_column :orders, :phone, :string
    add_column :orders, :note, :text
  end
end
