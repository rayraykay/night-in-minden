class Guest < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
				    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_secure_password
  validates :password, presence: true
  validates :ticket, presence: true
  
  # will need to be put later by the user
  belongs_to :table, optional: true
end
