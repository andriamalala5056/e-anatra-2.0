class Niveau < ApplicationRecord

    #association model
    has_many :etabs_filieres
    has_many :filieres, through: :etabs_filieres
    has_many :inscriptions
end
