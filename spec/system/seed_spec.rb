# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "SomeResource", type: :request do
  describe "登録画面(admin_seeds_path)のテスト" do
    let!(:seed) { create(:seed, name:'hoge') }
    before do
      @admin = FactoryBot.create(:admin)
      sign_in @admin
      visit admin_seeds_path
    end
    context '表示の確認' do
      it 'admin_seeds_pathが"/admin/seeds"であるか' do
        expect(current_path).to eq('/admin/seeds')
      end
      it '新規登録ボタンが表示されているか' do
        expect(page).to have_button '新規登録'
      end
      it '登録されたものが表示されているか' do
        expect(page).to have_content seed.name
      end
    end
    context '投稿処理のテスト' do
      it '登録後のリダイレクト先は正しいか' do
        fill_in 'seed[name]', with: Faker::Lorem.characters(number:5)
        click_button '新規登録'
        expect(page).to have_current_path admin_seeds_path
      end
    end
  end
end