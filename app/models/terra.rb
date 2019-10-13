class Terra < ApplicationRecord

	belongs_to :entitat

	validates :nom, presence: true
	validates :superficie, presence: true, numericality: { other_than: 0 }
	validates :longitud_perimetre, presence: true
	validates :profunditat, presence: true
	validates :resistencia_termica_aillant, presence: true
	validates :ample_aillament, presence: true

end
