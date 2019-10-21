class User < ApplicationRecord
	has_secure_password

	validates :name, presence: true
	validates :email, presence: true

	has_many :registered_students
	has_many :registered_teachers
end
