class HomeController < ApplicationController
  def index
    @etas = Etab.page(1).per(8)
  end
end
