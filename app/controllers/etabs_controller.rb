class EtabsController < ApplicationController
  before_action :get_id, only: [:show, :update, :destroy]
  def index
    @etab = Etab.all
  end

  def new
      if user_signed_in? && current_user.role == "responsable"
        @etab = Etab.new
      else
        redirect_to etabs_path
        flash[:notice] = "acces denied"
      end
  end

  def create

    @etab = Etab.new(etab_params)
    current_user.etab = @etab
    if @etab.save
      flash[:success] = "success"
      redirect_to @etab
    else
      redirect_to new
    end
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

  def etab_params
    params.require(:etab).permit(:nom_etab, :email, :phone_number, :address, :description, :category, :longitude, :latitude, :image)
  end

  def get_id
    @etab = Etab.find(params[:id])
  end
end
