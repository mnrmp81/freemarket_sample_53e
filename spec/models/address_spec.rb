require 'rails_helper'

describe Post do
  describe '#create' do

    context 'can save' do
      it 'is valid with a postal_code, prefecture_id, city, block, building' do
        expect(build(:address)).to be_valid
      end

      it 'is valid without a building' do
        address = build(:address, building: '')
        expect(address).to be_valid
      end

      it 'is valid with a postal_code that has a 7-digit integer' do
        address = build(:address, postal_code: '1111111')
        expect(address).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without a postal_code' do
        address = build(:address, postal_code: '')
        address.valid?
        expect(address.errors[:postal_code]).to include('入力してください')
      end

      it 'is invalid without a city' do
        address = build(:address, city: '')
        address.valid?
        expect(address.errors[:city]).to include('入力してください')
      end

      it 'is invalid without a block' do
        address = build(:address, block: '')
        address.valid?
        expect(address.errors[:block]).to include('入力してください')
      end

      it 'is invalid with a postal_code that has a 8-digit integer' do
        address = build(:address, postal_code: '12345678')
        address.valid?
        expect(address.errors[:postal_code]).to include('フォーマットが正しくありません')
      end

      it 'is invalid with a postal_code that has a 6-digit integer' do
        address = build(:address, postal_code: '123456')
        address.valid?
        expect(address.errors[:postal_code]).to include('フォーマットが正しくありません')
      end

      it 'is invalid with a postal_code that has alphabets' do
        address = build(:address, postal_code: 'abababa')
        address.valid?
        expect(address.errors[:postal_code]).to include('数字で入力してください')
      end

      it 'is invalid with a postal_code that has a symbol' do
        address = build(:address, postal_code: '123-456')
        address.valid?
        expect(address.errors[:postal_code]).to include('数字で入力してください')
      end
    end

  end
end
