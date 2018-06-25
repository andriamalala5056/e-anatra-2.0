class Article < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :etab
end
