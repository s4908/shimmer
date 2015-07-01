class ProductAttachment < ActiveRecord::Base
	mount_uploader :image, ProductMainImageUploader
	belongs_to :product
end
