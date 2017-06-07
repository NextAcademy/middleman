class User < ApplicationRecord
  include Clearance::User
  

  # associations
  has_one :company



  # # validations
  # validates :email, presence: true
  # validates :email, uniqueness: true
  # validates :full_name, presence: true
  # 
end
