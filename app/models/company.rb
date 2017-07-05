class Company < ApplicationRecord

  #associations
  belongs_to :user
  has_one :version

  #logo uploader
  mount_uploader :logo, LogoUploader

  #validations 
  validates :title, :url, presence: true
  validates :description, presence: true, on: :update
  

  def update_version(version)
    self.update_attributes(title: version.title, url: version.url, logo: version.logo, description: version.description, industry: version.industry, location: version.location, engineers: version.engineers, core_stack: version.core_stack, stage: version.stage)
  end

end
