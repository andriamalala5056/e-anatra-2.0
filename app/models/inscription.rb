class Inscription < ApplicationRecord
    belongs_to :etab
    belongs_to :user
    belongs_to :vague
    belongs_to :filiere
    belongs_to :niveau
end
