class NewsLetterController < ApplicationController
    before_action :get_id, only: [:show, :update, :edit, :destroy]

    def index
        @newsletters = NewsLetter.all
    end

    def new
    end

    def create
        @newsletter = NewsLetter.create(newsletter_params)
    end

    def show
    end

    def udate
    end

    def edit
    end

    def destroy
    end

    private

    def newsletter_params
      params.require(:newsletter).permit(:email)
    end
  
    def get_id
      @newsletter = NewsLetter.find(params:[:id])
    end
end
