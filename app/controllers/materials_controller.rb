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
    # params_to_be_used = material_params
    # remove_image_value = material_params[:remove_image]
    # params_to_be_used.delete(:remove_image)
    @material = Material.new(params_to_be_used)

    if @material.save
      redirect_to materials_path, notice: "#{@material.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @material = Material.find(params[:id])

    # params_to_be_used = material_params
    # remove_image_value = material_params[:remove_image]
    # params_to_be_used.delete(:remove_image)
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
      :title, :release_date, :director, :runtime_in_minutes, :description, :poster_image, :remove_poster_image
    )
  end
end
