class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :price
      t.integer :quantity
      t.timestamps null: false
    end
    add_foreign_key :order_items, :products
    add_foreign_key :order_items, :orders
  end
end
