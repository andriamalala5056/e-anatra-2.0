class Etab < ApplicationRecord
	mount_uploader :image, ImageUploader

	#un etab appartient à un user
	belongs_to :user
	#un etab a 0 ou plusieurs filieres
	has_and_belongs_to_many :filieres
end
