class Forat < ApplicationRecord

	belongs_to :entitat
	
	validates :nom, presence: true

end
