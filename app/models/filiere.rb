class Filiere < ApplicationRecord

    #association model    
    has_many :etabs_filieres    
    has_many :etabs, through: :etabs_filieres
end
