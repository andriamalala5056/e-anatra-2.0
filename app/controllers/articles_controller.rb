class ArticlesController < ApplicationController
  before_action :get_id, only: [:show, :update, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def new
    if user_signed_in?
      if current_user.role == "responsable"
        if current_user.etab != nil
          @article = Article.new
        else
          flash[:error] = "Créez dabord votre établissement !"
          redirect_to new_etab_path
        end
      else
        flash[:error] = "Vous n'êtes pas responsable !"
        redirect_to root_path
      end
    else
      flash[:error] = "Connectez dabord !"
      redirect_to new_user_session_path
    end
  end

  def create
    @article = Article.new(article_params)
    @article.etab = current_user.etab
    @article.save
  end

  def edit
  end

  def update
    @article.update(article_params)
    if @article
      flash[:success] = "Modifié avec succès"
      redirect_to articles_path
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

  def article_params
    params.require(:article).permit(:titre, :description, :image)
  end

  def get_id
    @article = Article.find(params:[:id])
  end
end
