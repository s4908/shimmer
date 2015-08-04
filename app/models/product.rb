class Product < ActiveRecord::Base
	belongs_to :category
	has_many :product_attachments
	accepts_nested_attributes_for :product_attachments

  validates :title, presence: true
  validates :category_id, presence: true
  validates :price, presence: true

  def main_image
    self.product_attachments.where(:image_type => 'main').first
  end
end
