require 'rails_helper'

RSpec.describe Resume, type: :model do
  it "名前が空なら無効なこと" do
    resume = FactoryBot.build(:resume,name: nil)
    resume.valid?
    expect(resume.errors[:name]).to include("can't be blank")
  end
end
