class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :order_details, dependent: :destroy

  belongs_to :shop

  has_one_attached :item_image

  validates :item_image, presence: true

  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax
    (price*1.08).floor
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
