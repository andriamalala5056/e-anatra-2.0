class Etablissement < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :role
end
