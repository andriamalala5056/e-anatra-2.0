class EtabsFiliere < ApplicationRecord
    belongs_to :filiere
    belongs_to :etab
    belongs_to :niveau
end
