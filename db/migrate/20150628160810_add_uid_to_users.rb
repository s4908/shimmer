class AddUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :provider, :uid, :string
  end
end
