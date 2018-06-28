class StatusEtudiantsController < ApplicationController
  def index
    if user_signed_in?
      if current_user.role == "etudiant"
        @statut = Inscription.where(user_id: params[:id])
      else
        flash[:error] = "Vous n'êtes pas un étudiant !"
        redirect_to user_session_path
      end
    else
      flash[:error] = "Vous devez vous inscrire !"
      redirect_to user_session_path
    end
  end
end
