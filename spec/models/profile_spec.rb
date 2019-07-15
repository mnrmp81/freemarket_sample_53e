require 'rails_helper'

describe Profile do
  describe '#create' do

    context 'can save' do
      it 'is valid with a family_name, first_name, family_name_kana, first_name_kana' do
        expect(build(:profile)).to be_valid
      end

      it 'is valid with a family_name_kana with "katakana"' do
        profile = build(:profile, family_name_kana: 'カタカナ')
        expect(profile).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without a family_name' do
        profile = build(:profile, family_name: '')
        profile.valid?
        expect(profile.errors[:family_name]).to include('入力してください')
      end

      it 'is invalid without a first_name' do
        profile = build(:profile, first_name: '')
        profile.valid?
        expect(profile.errors[:first_name]).to include('入力してください')
      end

      it 'is invalid without a family_name_kana' do
        profile = build(:profile, family_name_kana: '')
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include('入力してください')
      end

      it 'is invalid without a first_name_kana' do
        profile = build(:profile, first_name_kana: '')
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include('入力してください')
      end
    end

  end
end