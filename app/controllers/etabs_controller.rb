class EtabsController < ApplicationController
  before_action :get_id, only: [:show, :edit, :update, :destroy]

  def index
    @etab = Etab.search(params[:term])
    # @etab = if params[:term]
    #   Etab.where('nom_etab LIKE ?', "%#{params[:term]}%")
    # else
    #   Etab.all
    # end
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
  end

  def show
    @etab = Etab.find(params[:id])
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
