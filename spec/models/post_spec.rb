require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    context '投稿が投稿できる場合' do
      it '画像とコンテントを投稿できる' do
        expect(@post).to be_valid
      end
      it 'コンテントのみで投稿できる' do
      end
    end
    context 'ツイートが投稿できない場合' do
      it 'コンテントが空では投稿できない' do
      end     
      it 'ユーザーが紐付いていなければ投稿できない' do
      end
    end
  end
end

