class Admin::CyclesController < ApplicationController
  def index
    @cycles = Cycle.all.includes(:policy, :location)
  end

  def new
    @cycle = Cycle.new
  end

  def show
    @cycle = Cycle.includes(:policy, :location).find(params[:id])
  end

  def create
    @cycle = Cycle.new(cycle_params)
    puts @cycle.inspect
    if @cycle.save
      redirect_to admin_cycles_path, notice: "Successfully Created New Cycle"
    else
      render new_admin_cycle_path
    end
  end

  def edit
    @cycle = Cycle.includes(:policy, :location).find(params[:id])
  end

  def update
    @cycle = Cycle.includes(:policy, :location).find(params[:id])
    if @cycle.update(cycle_params_edit)
      redirect_to admin_cycles_path, notice: "Successfully Updated Cycle"
    else
      render edit_admin_cycle_path
    end
  end

  def delete
  end

  def cycle_params
    params.require(:cycle).permit(:created_by, :last_modified_by, :roll_out, :status, :isCurrent, :cycle_year, :location_id, :policy_id)
  end
  def cycle_params_edit
    params.require(:cycle).permit(:last_modified_by, :cycle_year, :location_id)
  end
end
