require 'rails_helper'

RSpec.describe ItemManagementAddress, type: :model do
  describe '#create' do
    before do
      @item_management_address = FactoryBot.build(:item_management_address)
    end

    it 'numberとexp_month、exp_year、cvc, zip_code, prefecture_id、city、lot_number、building_name、telephoneが存在すれば登録出来ること' do
      expect(@item_management_address).to be_valid
    end

    it 'クレジットカード情報は必須で、正しいカード情報が入力されていないと保存できないこと' do
      @item_management_address.token = nil
      @item_management_address.valid?
      expect(@item_management_address.errors.full_messages).to include "Token can't be blank"
    end

    it '郵便番号が空だと保存できないこと' do
      @item_management_address.zip_code = nil
      @item_management_address.valid?
      expect(@item_management_address.errors.full_messages).to include "Zip code can't be blank"
    end

    it '都道府県が空だと保存できないこと' do
      @item_management_address.prefecture_id = nil
      @item_management_address.valid?
      expect(@item_management_address.errors.full_messages).to include "Prefecture Select"
    end
    
    it '市区町村が空だと保存できないこと' do
      @item_management_address.city = nil
      @item_management_address.valid?
      expect(@item_management_address.errors.full_messages).to include "City can't be blank"
    end

    it '番地が空だと保存できないこと' do
      @item_management_address.lot_number = nil
      @item_management_address.valid?
      expect(@item_management_address.errors.full_messages).to include "Lot number can't be blank"
    end

    it '電話番号が空だと保存できないこと' do
      @item_management_address.telephone = nil
      @item_management_address.valid?
      expect(@item_management_address.errors.full_messages).to include "Telephone can't be blank"
    end
    
    it '郵便番号にハイフンがないと登録できないこと' do
      @item_management_address.zip_code = "1111111"
      @item_management_address.valid?
      expect(@item_management_address.errors.full_messages).to include "Zip code Input correctly"
    end

    it '電話番号にハイフンがあると登録できないこと' do
      @item_management_address.telephone = "090-0000-0000"
      @item_management_address.valid?
      expect(@item_management_address.errors.full_messages).to include "Telephone is invalid"
    end
  end
end