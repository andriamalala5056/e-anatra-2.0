class Newsletter < ApplicationRecord
    validates :lastname, presence: true
    validates :firstname, presence: true
    validates :email, presence: true
end
