class Coberta < ApplicationRecord

	belongs_to :entitat
	has_many :component_cobertes

	validates :nom, presence: true
	validates :superficie, presence: true, numericality: { other_than: 0 }

end
