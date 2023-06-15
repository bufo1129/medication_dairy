# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Adminモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { admin.valid? }

    let!(:other_admin) { create(:admin) }
    let(:admin) { build(:admin) }

    context 'emailカラム' do
      it '空欄でないこと' do
        admin.email = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'AdminSeeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Admin.reflect_on_association(:admin_sees).macro).to eq :has_many
      end
    end
  end
end