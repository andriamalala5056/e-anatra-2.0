class EtabsController < ApplicationController
  before_action :get_id, only: [:show, :edit, :update, :destroy]

  def index
    # L'index affiche par défaut la liste des établissements en ordre décroissant c-à-d
    # La plus récent au plus anciens sauf si le visiteur a entré un critère dans le champs de recherche
    @etab = Etab.search(params[:term]).page(1).per(12)
  end

  def new
      if user_signed_in? && current_user.role == "responsable"
        if current_user.etab != nil
          flash[:notice] = "Vous avez déjà votre établissement"
          redirect_to etab_path(current_user.etab.id)
        else
          @etab = Etab.new
        end
      else
        flash[:notice] = "Vous n'êtes pas responsable"
        redirect_to root_path
       # flash[:notice] = "acces denied"
      end
  end

  def create

    @etab = Etab.new(etab_params)
     @etab.user_id =current_user.id
    #  @etab.province = Province.find(params[:etab][:province_id])
     @etab.province = Province.find(params[:province])
    if @etab.save
      flash[:success] = "success"
      redirect_to etabs_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @etab.update(etab_params)
    if @etab
      flash[:success] = "Modifié avec succès"
      redirect_to etabs_path
    else
      flash[:notice] = "Il y a peut-être un erreur"
      render "edit"
    end
  end

  def show
  end

  def destroy
  end

  private

  def etab_params
    params.require(:etab).permit(:nom_etab, :email, :phone_number, :address, :description, :category, :longitude, :latitude, :image, :term)
  end

  def get_id
    @etab = Etab.find(params[:id])
  end
end
