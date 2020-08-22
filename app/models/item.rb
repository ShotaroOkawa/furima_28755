class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition

  validates :category_id, :condition_id, :delv_fee_id, :delv_from_id, :delv_time_id, numericality: { other_than: 1 } 
end
