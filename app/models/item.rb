class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  has_one_attached :image

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delv_fee_id
    validates :delv_from_id
    validates :delv_time_id
  end

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :image
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }  # 価格が¥300~¥9,999,999であるか
end
