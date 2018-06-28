class HomeController < ApplicationController
  def index
  	@etab = Etab.order(created_at: :desc).page(1).per(8)
  end
end
