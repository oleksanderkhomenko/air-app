class PassengersController < ApplicationController
  def new
    @plane = Plane.find(params[:plane_id])
    @passenger = @plane.passengers.build
  end

  def create
    @plane = Plane.find(params[:plane_id])
    @passenger = @plane.passengers.build(passenger_params)
    if @passenger.save
      redirect_to passenger_path(@passenger)
    else
      render 'new'
    end
  end

  def edit
    @passenger = Passenger.find(params[:id])
    @plane = Plane.find(@passenger.plane_id)
  end

  def update
    @passenger = Passenger.find(params[:id])
    if @passenger.update(passenger_params)
      redirect_to passenger_path(@passenger)
    else
      render 'edit'
    end
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def destroy
    @passenger = Passenger.find(params[:id])
    @passenger.destroy
    redirect_to plane_path(@passenger.plane_id)
  end

  private

  def passenger_params
    params[:passenger].permit(:name)
  end
end
