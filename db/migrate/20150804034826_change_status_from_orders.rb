class ChangeStatusFromOrders < ActiveRecord::Migration
  def down
  end

  def up
    change_column :orders, :status, :integer, default: 0
  end
end
