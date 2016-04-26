class MaterialsController < ApplicationController
  def index
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
  end

  def new
    @material = Material.new
  end

  def edit
    @material = Material.find(params[:id])
  end

  def create
    @material = Material.new(material_params)

    if @material.save
      redirect_to materials_path
    else
      render :new
    end
  end

  def update
    @material = Material.find(params[:id])

    if @material.update_attributes(material_params)
      redirect_to material_path(@material)
    else
      render :edit
    end
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to materials_path
  end

  protected

  def material_params
    params.require(:material).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description
    )
  end
end
