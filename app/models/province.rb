class Province < ApplicationRecord
    has_many :etabs
    has_many :inscriptions
end
