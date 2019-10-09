class Entitat < ApplicationRecord

	belongs_to :user
	has_one_attached :imatge_entitat

	has_many :murs
	has_one :certificacio

end
