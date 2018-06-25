class EtabsFilieresController < ApplicationController
  def index
  end

  def show
    @etabs_filiere = EtabsFiliere.new
    @e_f_n = EtabsFiliere.where(etab_id: params[:id])
  end

  def new
    if user_signed_in?
      if current_user.role == "responsable"
        if current_user.etab != nil
          @etabs_filiere = EtabsFiliere.new
        else
          flash[:error] = "Créez dabord votre établissement !"
          redirect_to new_etab_path
        end
      else
        flash[:error] = "Vous n'êtes pas responsable !"
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def create
    @e = current_user.etab
    @a = EtabsFiliere.where(etab_id: @e.id)
    @f = Filiere.find(params[:etabs_filiere][:filiere_id])
    @n = Niveau.find(params[:etabs_filiere][:niveau_id])
 
    @e_f_n = EtabsFiliere.new
    @e_f_n.filiere = @f
    @e_f_n.etab = @e
    @e_f_n.niveau = @n
    @e_f_n.place = params[:etabs_filiere][:place]
    couple = false
    @a.each do |assoc|
      if @e == assoc.etab && @f == assoc.filiere && @n == assoc.niveau
        couple = true
      end
    end
    
    #si le couple existe déjà
    if couple
      flash[:error] = "Donnée déjà existée !"
      redirect_to new_etabs_filiere_path
    else
      @e_f_n.save
      flash[:error] = "Ajout avec success!"
      redirect_to etabs_filiere_path(@e.id)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @e_f_n = EtabsFiliere.find(params[:id])
    @e_f_n.destroy
    redirect_to etabs_filiere_path(current_user.etab.id) 
  end

  private
  def e_f_params
    #params.require(:etabs_filiere).permit(:)    
  end
end
