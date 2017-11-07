class PlanesController < ApplicationController
  def new
    @city = City.find(params[:city_id])
    @plane = @city.planes.build
  end

  def create
    @city = City.find(params[:city_id])
    @plane = @city.planes.build(plane_params)
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render 'new'
    end
  end

  def edit
    @plane = Plane.find(params[:id])
    @city = City.find(@plane.city_id)
  end

  def update
    @plane = Plane.find(params[:id])
    if @plane.update(plane_params)
      redirect_to plane_path(@plane)
    else
      render 'edit'
    end
  end

  def show
    @plane = Plane.find(params[:id])
    @passengers = @plane.passengers
    @tickets = @plane.tickets
  end

  def destroy
    @plane = Plane.find(params[:id])
    @plane.destroy
    redirect_to city_path(@plane.city_id)
  end

  private

  def plane_params
    params[:plane].permit(:name)
  end
end
