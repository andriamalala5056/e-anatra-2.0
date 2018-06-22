class Filiere < ApplicationRecord


    #association model
    has_and_belongs_to_many :etabs
    has_and_belongs_to_many :niveau
end
