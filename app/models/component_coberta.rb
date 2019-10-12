class ComponentCoberta < ApplicationRecord

	belongs_to :coberta

	validates :nom, presence: true
	validates :conductivitat, presence: true
	validates :gruix, presence: true

end
