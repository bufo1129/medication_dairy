# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Storeモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { store.valid? }

    let!(:other_store) { create(:store) }
    let(:store) { build(:store) }

    context 'バリデーションチェック' do
      it 'nameが空白でないこと' do
        store.name = ''
        is_expected.to eq false
      end
      it 'postal_codeが空白でないこと' do
        store.postal_code = ''
        is_expected.to eq false
      end
      it 'prefecture_codeが空白でないこと' do
        store.prefecture_code = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Individualモデルとの関係' do
      it '1:Nとなっている' do
        expect(Store.reflect_on_association(:individuals).macro).to eq :has_many
      end
    end
    context 'Dairyモデルとの関係' do
      it '1:Nとなっている' do
        expect(Store.reflect_on_association(:dairies).macro).to eq :has_many
      end
    end
    context 'Medicationモデルとの関係' do
      it '1:Nとなっている' do
        expect(Store.reflect_on_association(:medications).macro).to eq :has_many
      end
    end
    context 'Commentsモデルとの関係' do
      it '1:Nとなっている' do
        expect(Store.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'Favoritesモデルとの関係' do
      it '1:Nとなっている' do
        expect(Store.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Seeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Store.reflect_on_association(:sees).macro).to eq :has_many
      end
    end
  end
end