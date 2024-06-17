class Tag < ApplicationRecord
    has_many :food_tag_relations, dependent: :destroy
    has_many :foods, through: :food_tag_relations, dependent: :destroy
end
