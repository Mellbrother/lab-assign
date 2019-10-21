class User < ApplicationRecord
	has_secure_password

	validates :name, presence: true
	validates :email, presence: true
	validate :validate_social_postion

	has_many :registered_students
	has_many :registered_teachers

	private

	def validate_social_postion
		if student && teacher
			errors.add(:student, "学生と教員は兼任できません。")
		end
	end
end
