class Admin::TopUpsController < ApplicationController
  before_action :require_user_logged_in!
  def index
    @topups = TopUp.all.includes(:cycle, :location)
  end

  def new
    @cycles = Cycle.all
    @topup = TopUp.new
  end
  def create
    @topup = TopUp.new(topup_params)
    #puts @topup.inspect
    if @topup.save
      redirect_to admin_top_ups_path, notice: "Successfully Created New Top Up"
    else
      @cycles = Cycle.all
      render new_admin_top_up_path
    end
  end

  def edit
  end

  def show
    @topup = TopUp.includes(:cycle, :location).find(params[:id])
  end
  def topup_params
    params.require(:top_up).permit(:coverage, :amount_deductable, :cycle_id, :created_by, :last_modified_by, :location_id, :description)
  end
end
