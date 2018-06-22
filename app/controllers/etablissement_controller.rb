class EtablissementController < ApplicationController
  before_action :get_id, only: [:show, :update, :edit, :destroy]
  def index
    @etablissements = Etablissement.all
  end

  def new
    # if user_signed_in?
    #   if User.role == "responsable"
        @etablissement = Etablissement.new
    #   else
    #     flash[:error] = "Vous avez déjà votre établissement!"
    #     redirect_to etablissement_path
    #   end
    # else
    #   flash[:error] = "Vous n'êtes pas un responsable!"
    #   redirect_to etablissements_path
    # end
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
    params.require(:etablissement).permit(:nom_etab, :email, :phone_number, :address, :description, :category, :longitude, :latitude, :image, :province_name)
  end

  def get_id
    @etablissement = Etablissement.find(params:[:id])
  end
end
