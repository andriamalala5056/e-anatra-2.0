class EtablissementController < ApplicationController
  before_action :get_id, only: [:show, :update, :destroy]
  def index
    @etablissements = Etablissement.all
  end

  def new
    @etablissement = Etablissement.new
  end

  def create
    @etablissement = Etablissement.create(etablissement_params)
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def etablissement_params
    params.require(:etablissement).permit(:nom_etab, :email, :phone_number, :address, :description, :category, :longitude, :latitude, :image)
  end

  def get_id
    @etablissement = Etablissement.find(params:[:id])
  end
end
