class Version < ApplicationRecord
  belongs_to :company

  mount_uploader :logo, LogoUploader

  skip_callback :commit, :after, :remove_logo!
end
