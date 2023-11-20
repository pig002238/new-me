require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    @post.image.attach(io: File.open('app/assets/images/Railsの処理の流れ.png'), filename: 'image.png', content_type: 'image/png')
  end

  describe '投稿の保存' do
    context '投稿が投稿できる場合' do
      it 'imageとcontentを投稿できる' do
        expect(@post).to be_valid
      end
      it 'contentのみで投稿できる' do
        @post.image.purge
        expect(@post).to be_valid
      end
    end
    context '投稿が投稿できない場合' do
      it 'contentが空では投稿できない' do
        post_attributes = FactoryBot.attributes_for(:post, content: "")
        @post = Post.new(post_attributes)
        @post.valid?
        expect(@post.errors.full_messages).to include("Contentを入力してください")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

