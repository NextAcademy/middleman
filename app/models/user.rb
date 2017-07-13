class User < ApplicationRecord
  include Clearance::User

  # associations
  has_one :company

  enum role: [:normal_user, :moderator, :superadmin]

  # # validations
  validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please input a valid email address"}
  validates :full_name, presence: true
  validates :password, length: { minimum: 5 }, on: :create
  

end
