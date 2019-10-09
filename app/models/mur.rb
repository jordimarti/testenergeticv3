class Mur < ApplicationRecord

	belongs_to :entitat
	has_many :component_murs
	
end
