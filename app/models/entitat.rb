class Entitat < ApplicationRecord

	belongs_to :user
	has_one_attached :imatge_entitat

	has_many :murs
	has_many :forats
	has_many :cobertes
	has_many :terres
	has_many :lampades
	has_one :climatitzacio
	has_many :aparells
	has_one :consum_global
	has_one :certificacio

end
