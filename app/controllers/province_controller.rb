class ProvinceController < ApplicationController
  before_action :get_id, only: [:show, :update, :edit, :destroy]

  def index
  end

  def new
    @province.new
  end

  def create
    @province = Province.create(province_params)
  end
  def show
  end

  def edit
  end

  def update
  end

  private

  def province_params
    params.require(:province).permit(:province_name)
  end

  def get_id
    @province = Province.find(params:[:id])
  end
end
