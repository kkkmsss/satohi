class Food < ApplicationRecord
    has_many :food_tag_relations, dependent: :destroy
    has_many :tags, through: :food_tag_relations, dependent: :destroy
    has_one_attached :image_top
  has_many_attached :images
 belongs_to :user 

 validates :image_top, :images, content_type: { in: %w[image/jpeg image/gif image/png],
                                   message: "must be a valid image format" },
                                size: { less_than: 5.megabytes,    
                                        message: "should be less than 5MB" }
                                        def resize_image_top
                                            image_top.variant(resize_to_limit: [500, 200])
                                          end
end
