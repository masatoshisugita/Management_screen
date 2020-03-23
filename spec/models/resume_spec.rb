require 'rails_helper'

RSpec.describe Resume, type: :model do
    it "有効なresumeを持つこと" do
      expect(FactoryBot.build(:resume)).to be_valid
    end

    it "名前、年齢、誕生日、自己PRがあれば有効なこと" do
      resume = Resume.new(
        name: "鈴木次郎",
        age: 25,
        birthday: "1994-08-01",
        promotion: "一生懸命がんばります。"
      )
      expect(resume).to be_valid
    end

    it "名前が空なら無効なこと" do
      resume = FactoryBot.build(:resume,name: nil)
      resume.valid?
      expect(resume.errors[:name]).to include("can't be blank")
    end


    it "名前が16文字以上なら無効なこと" do
      resume = FactoryBot.build(:resume,name: "あ" * 16)
      expect(resume).not_to be_valid
      expect(resume.errors[:name]).to be_present
    end

    it "年齢が空なら無効なこと" do
      resume = FactoryBot.build(:resume,age: nil)
      resume.valid?
      expect(resume.errors[:age]).to include("can't be blank")
    end

    it "年齢が4文字以上なら無効なこと" do
      resume = FactoryBot.build(:resume,age: 1000)
      expect(resume).not_to be_valid
      expect(resume.errors[:age]).to be_present
    end

    it "誕生日が空なら無効なこと" do
      resume = FactoryBot.build(:resume,birthday: nil)
      resume.valid?
      expect(resume.errors[:birthday]).to include("can't be blank")
    end

    it "自己PRが空なら無効なこと" do
      resume = FactoryBot.build(:resume,promotion: nil)
      resume.valid?
      expect(resume.errors[:promotion]).to include("can't be blank")
    end

    it "自己PRが401文字以上なら無効なこと" do
      resume = FactoryBot.build(:resume,promotion: "あ" * 401)
      expect(resume).not_to be_valid
      expect(resume.errors[:promotion]).to be_present
    end
    
    #ショルダーマッチャを使うことで、バリデーションを一行で書くことができる
    # it { is_expected.to validate_presence_of :name }
    # it { is_expected.to validate_presence_of :age }
    # it { is_expected.to validate_presence_of :birthday }
    # it { is_expected.to validate_presence_of :promotion}

end
