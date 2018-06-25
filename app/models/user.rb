class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  has_one :etab 
  mount_uploader :image, ImageUploader
 
  has_many :inscriptions    
	has_many :etab, through: :inscriptions
end
