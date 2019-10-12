class ComponentMur < ApplicationRecord

	belongs_to :mur

	validates :nom, presence: true
	validates :conductivitat, presence: true
	validates :gruix, presence: true
	
end
