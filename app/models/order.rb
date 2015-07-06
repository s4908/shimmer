class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def quantity
    self.order_items.size
  end

  def shipping_fee
    sub_total < 1000 ? 100 : 0
  end

  def sub_total
    self.order_items.sum(:price)
  end

  def grand_total
    sub_total + shipping_fee
  end
end
