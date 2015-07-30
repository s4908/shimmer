class Product < ActiveRecord::Base
	belongs_to :category
	has_many :product_attachments
	accepts_nested_attributes_for :product_attachments

  validates :title, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
end
