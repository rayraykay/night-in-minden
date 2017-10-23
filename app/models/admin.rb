class Admin < ApplicationRecord
	validates :username, presence: true, length: { maximum: 30 }, uniqueness: true
	has_secure_password
	validates :password, presence: true
end
