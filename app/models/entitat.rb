class Entitat < ApplicationRecord

	belongs_to :user
	has_one_attached :imatge_entitat

end
