class Student < ApplicationRecord
	validates :mynumber, presence: true
	validates :name, presence: true
end
