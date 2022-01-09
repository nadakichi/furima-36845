require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_code「3桁ハイフン4桁」の半角文字列のみ保存できる' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空だと保存できない' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneは10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order_address.telephone = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
