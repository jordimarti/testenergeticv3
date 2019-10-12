class Coberta < ApplicationRecord

	belongs_to :entitat

	validates :nom, presence: true
	validates :superficie, presence: true, numericality: { other_than: 0 }

end
