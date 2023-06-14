# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seed, "モデルに関するテスト", type: :model do

  describe 'モデル(seed)のテスト' do

    context '投稿のテスト' do
      it "有効な投稿内容(seed)の場合は保存されるか" do
        expect(FactoryBot.build(:seed)).to be_valid
      end
    end

    context "バリデーションチェック" do
      it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        seed = Seed.new(name: '')
        expect(seed).to be_invalid
        expect(seed.errors[:name]).to include("を入力してください")
      end
      it "種類名が重複している場合は無効であること" do
        Seed.create(
          name: 'コザクラインコ'
          )
        @seed = Seed.new(
          name: 'コザクラインコ'
          )
        @seed.valid?
        expect(@seed.valid?).to eq(false)
      end
    end

  end

end

