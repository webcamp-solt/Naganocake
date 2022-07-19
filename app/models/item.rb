class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :ordered_items, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  def get_image
    if image.attached?
      image
    else
      'no_image.jpeg'
    end
  end
end
