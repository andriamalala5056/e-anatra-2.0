class InscriptionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @inscription = Inscription.new
  end

  def create
    @etab = Etab.find(params[:inscription][:etab_id])
    @filiere = Filiere.find(params[:inscription][:filiere_id])
    @province = Province.find(params[:inscription][:province_id])
    @vague = Vague.find(params[:inscription][:vague_id])
    @niveau = Niveau.find(params[:inscription][:niveau_id])

  
      #tout les inscrits dans une établissement donné
        @inscrit = Inscription.where(etab_id: @etab.id)
        couple =false
        @inscrit.each do |assoc|
          if ((assoc.user == current_user) && (assoc.vague == @vague) && (assoc.etab == @etab) && (assoc.province == @province) && (assoc.filiere == @filiere) && (assoc.niveau == @niveau))
                # couple déjà existé
                couple = true
          end
        end

        # couple déjà existé
        if couple
            flash[:error] = "Vous êtes déjà inscrit!"
            redirect_to etab_path(@etab.id)
        else
            inscri = Inscription.new()
            inscri.filiere = @filiere
            inscri.etab = @etab
            inscri.niveau = @niveau
            inscri.vague = @vague
            inscri.province = @province
            inscri.user = current_user
            
            if inscri.save
                flash[:success]= "Félicitation, vous êtes inscrit!"
                redirect_to inscriptions_path
            else
                flash[:error] = "Erreur lors d'inscription! Champ invalid peut être"
                redirect_to new_etab_path
            end
        end
  end

  def edit
  end

  def update
  end

  def delete
  end
end
