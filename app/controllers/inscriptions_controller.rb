class InscriptionsController < ApplicationController
  def index
  end

  def show
    if user_signed_in?
      if current_user.role == "responsable"
        if current_user.etab != nil
          @inscriptions = Inscription.where(etab_id: params[:id])
        end
      end
    end
  end

  def new
    if user_signed_in?
      if current_user.role == "etudiant" 
        #si c'est un étudiant
        @inscription = Inscription.new
      else
        flash[:error] = "Vous n'êtes pas un étudiant!"
        redirect_to etabs_path
      end
    else
      flash[:error] = "Connecter vous d'abord!"
      redirect_to user_session_path
    end
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
          #if ((assoc.user == current_user) && (assoc.vague == @vague) && (assoc.etab == @etab) && (assoc.province == @province) && (assoc.filiere == @filiere) && (assoc.niveau == @niveau))
          if ((assoc.user == current_user) && (assoc.etab == @etab))   
          # couple déjà existé
                couple = true
          end
        end

        # couple déjà existé
        if couple
            flash[:error] = "Vous êtes déjà inscrit!"
            redirect_to satusE_path(current_user.id)
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
                ContactMailer.new_subscription(@etab.user.email).deliver_now
                ContactMailer.inscrit(current_user.email).deliver_now
                redirect_to satusE_path(current_user.id)
            else
                flash[:error] = "Erreur lors d'inscription! Champ invalid peut être"
                redirect_to new_inscription_path
            end
        end
  end

  def edit
    @etudiant = Inscription.find(params[:id])
    if @etudiant.valide == false
      @etudiant.valide = true
      if @etudiant.save
        flash[:success] = "Validation ok!"
        redirect_to inscription_path(current_user.etab.id)
      else
        flash[:success] = "Erreur!"
        redirect_to inscription_path(current_user.etab.id)
      end
    else
      @etudiant.valide = false
      if @etudiant.save
        flash[:success] = "Annulation ok!"
        redirect_to inscription_path(current_user.etab.id)
      else
        flash[:success] = "Erreur!"
        redirect_to inscription_path(current_user.etab.id)
      end
    end
  end

  def update
    # #validation etudiant & envoyer mail à l'étudiant en question pour lui dire que son inscription est validé ou non
    # @etudiant = Inscription.find(params[:id])
    # @etudiant.valide = true
    # if @etudiant.save
    #   flash[:success] = "Validation ok!"
    #   redirect_to inscription_path(current_user.etab.id)
    # else
    #   flash[:success] = "Erreur!"
    #   redirect_to inscription_path(current_user.etab.id)
    # end
  end

  def destroy
    @etudiant = Inscription.find(params[:id])
    @etudiant.destroy
    redirect_to inscription_path(current_user.etab.id)
  end
end
