class Post < ApplicationRecord

def self.search(keyword)
  where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
end

belongs_to :user

has_many :post_images, dependent: :destroy
accepts_nested_attributes_for :post_images
accepts_attachments_for :post_images, attachment: :image

has_many :post_comments, dependent: :destroy

end
