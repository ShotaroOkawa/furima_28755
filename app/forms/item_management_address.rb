class ItemManagementAddress

  include ActiveModel::Model
  attr_accessor :price, :token, :item_id, :zip_code, :prefecture_id, :city, :lot_number, :building_name, :telephone, :user_id

  with_options presence: true do
    validates :zip_code
    validates :city
    validates :lot_number
    validates :telephone
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  validates :zip_code, format: { with: /\A\d{3}\-\d{4}\z/, message: 'Input correctly' }
  validates :telephone, format: { with:  /\A\d{1,11}\z/ }

  def save
    item_management = ItemManagement.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, lot_number: lot_number, building_name: building_name, telephone: telephone, item_management_id: item_management.id)
  end

end