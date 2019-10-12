class Mur < ApplicationRecord

	belongs_to :entitat
	has_many :component_murs

	validates :nom, presence: true
	validates :superficie, presence: true, numericality: { other_than: 0 }
	
end
