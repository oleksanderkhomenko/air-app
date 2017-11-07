class CitiesController < ApplicationController
  def new
    @country = Country.find(params[:country_id])
    @city = @country.cities.build
  end

  def create
    @country = Country.find(params[:country_id])
    @city = @country.cities.build(city_params)
    if @city.save
      redirect_to city_path(@city)
    else
      render 'new'
    end
  end

  def edit
    @city = City.find(params[:id])
    @country = Country.find(@city.country_id)
  end

  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      redirect_to city_path(@city)
    else
      render 'edit'
    end
  end

  def show
    @city = City.find(params[:id])
    @planes = @city.planes
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to country_path(@city.country_id)
  end

  private

  def city_params
    params[:city].permit(:name)
  end
end
