class VaguesController < ApplicationController
  def index
  end

  def show
    
  end

  def new
    @vague = Vague.new
  end

  def create
    @vague = Vague.new(vague_params)
    @vague.etab = current_user.etab
    if @vague.save
      flash[:success] = "Vague bien enregéstré"
      redirect_to etab_path(current_user.etab.id)
    else
      flash[:error] = "Erreur d'enregistrement"
      redirect_to new_vague_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def vague_params
    params.require(:vague).permit(:debut_session, :fin_session)
  end

  def get_id
    return Vague.find(params[:id])
  end
end
