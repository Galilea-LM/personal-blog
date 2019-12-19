class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image_profile
  has_rich_text :rich_biography
end
