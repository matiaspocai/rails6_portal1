class Article < ApplicationRecord
  has_one_attached :image
  has_one_attached :imagedos
  has_rich_text :cuerpo
end
