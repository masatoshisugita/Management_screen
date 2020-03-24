require 'rails_helper'

RSpec.feature "Resumes", type: :feature do
  scenario "新しいresumeを作成する" do
    visit root_path

    expect {
    click_on "経歴書作成"

    fill_in "Name" ,with: "Test Name"
    fill_in "Age" ,with: 30
    find("input[value='男']").set(true)
    select "1992",from: "resume_birthday_1i"
    select "3",from: "resume_birthday_2i"
    select "15",from: "resume_birthday_3i"
    fill_in "Promotion" ,with: "がんばります"
    uncheck "Marry"
    
    click_button "登録"

    expect(page).to have_content "投稿に成功しました"
    expect(page).to have_content "Test Name"
    expect(page).to have_content 30
  }.to change{Resume.count}.by(1)
  end
end
