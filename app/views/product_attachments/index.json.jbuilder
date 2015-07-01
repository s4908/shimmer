json.array!(@product_attachments) do |product_attachment|
  json.extract! product_attachment, :id, :product_id, :main_image, :other_images
  json.url product_attachment_url(product_attachment, format: :json)
end
