class Resume < ApplicationRecord
  mount_uploader :file, FileUploader

  validates :name, presence: true
  validates :name, length: { maximum: 15 }

  validates :age, presence: true
  validates :age,length: { maximum: 3 }

  validates :birthday, presence: true

  validates :promotion, presence: true
  validates :promotion, length: { maximum: 400 }

end
