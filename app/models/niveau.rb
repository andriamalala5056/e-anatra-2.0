class Niveau < ApplicationRecord

    #association model
    has_and_belongs_to_many :filieres

end
