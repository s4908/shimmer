class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  enum status: {temp: 0 , in_progress: 1, complete: 2}

  scope :confirmed_orders, -> { where(status: [statuses[:in_progress], statuses[:complete]]) }

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
