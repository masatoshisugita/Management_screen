FactoryBot.define do
  factory :resume do
    name "Test Name"
    age 30
    gender "男"
    birthday "1993-01-01"
    promotion "がんばります"
    marry true
    file File.open(File.join(Rails.root, 'spec/files/test_file.jpg'))

    #無効になっている
    trait :invalid do
      name nil
    end

  end
end
