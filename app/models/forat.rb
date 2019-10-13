class Forat < ApplicationRecord

	belongs_to :entitat
	
	validates :nom, presence: true
	validates :superficie_marc, presence: true
	validates :transmitancia_marc, presence: true
	validates :tipus_marc, presence: true
	validates :superficie_transparent, presence: true
	validates :transmitancia_transparent, presence: true
	validates :longitud_contacte_marc_vidre, presence: true
	validates :tipus_vidre, presence: true
	validates :superficie_opaca, presence: true
	validates :transmitancia_opaca, presence: true
	validates :longitud_contacte_marc_opac, presence: true

end
