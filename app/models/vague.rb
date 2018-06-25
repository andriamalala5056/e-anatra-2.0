class Vague < ApplicationRecord
    belongs_to :etab
    has_many :inscriptions
end
