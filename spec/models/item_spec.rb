require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品画像必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名必須' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
      it '商品説明必須' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Text can't be blank")
      end
      it 'カテゴリー必須' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it '商品状態必須' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it '商品状態カラムはId1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it '配送料の負担情報必須' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery charge can't be blank")
      end
      it '配送料の負担情報のカラムはId1では登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery charge can't be blank")
      end
      it '発送元情報必須' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it '発送元情報のカラムはId1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it '発送までの日数必須' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery day can't be blank")
      end
      it '発送までの日数のカラムはId1では登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery day can't be blank")
      end
      it '価格情報必須' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it '価格300未満の時保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it '価格10000000以上の時保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
    end
  end
end
