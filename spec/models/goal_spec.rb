require 'rails_helper'

RSpec.describe Goal, type: :model do
  before do
    @goal = FactoryBot.build(:goal)
  end

  describe "目標新規登録" do
    context "新規登録できるとき" do
      it "purposeとgoal、actionとdeadlineが存在すれば登録できる" do
        expect(@goal).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "purposeが空では登録できない" do
        @goal.purpose = ""
        @goal.valid?
        expect(@goal.errors.full_messages).to include("目的を入力してください")
      end
      it "goalが空では登録できない" do
        @goal.goal = ""
        @goal.valid?
        expect(@goal.errors.full_messages).to include("目標を入力してください")
      end
      it "actionが空では登録できない" do
        @goal.action = ""
        @goal.valid?
        expect(@goal.errors.full_messages).to include("行動を入力してください")
      end
      it "deadlineが空では登録できない" do
        @goal.deadline = ""
        @goal.valid?
        expect(@goal.errors.full_messages).to include("期日を入力してください")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @goal.user = nil
        @goal.valid?
        expect(@goal.errors.full_messages).to include("Userを入力してください")
      end
    end
  end


end
