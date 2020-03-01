class Resume < ApplicationRecord
  mount_uploader :file, FileUploader
end
