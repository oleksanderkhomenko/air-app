class TicketsController < ApplicationController
  def new
    @plane = Plane.find(params[:plane_id])
    @ticket = @plane.tickets.build
  end

  def create
    @plane = Plane.find(params[:plane_id])
    @ticket = @plane.tickets.build(ticket_params)
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render 'new'
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @plane = Plane.find(@ticket.plane_id)
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to ticket_path(@ticket)
    else
      render 'edit'
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to plane_path(@ticket.plane_id)
  end

  private

  def ticket_params
    params[:ticket].permit(:name)
  end
end
