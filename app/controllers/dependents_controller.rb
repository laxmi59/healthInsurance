class DependentsController < ApplicationController
  def index
    @dependents = Dependent.where("employee_id = ?", Current.user.id)
  end

  def new
    @dependent = Dependent.new
  end

  def create
    @dependent = Dependent.new(dependent_params)
    #puts @dependent.inspect
    if @dependent.save
      redirect_to dependents_path, notice: "Successfully Created New Dependent"
    else
      @cycles = Cycle.all
      render new_dependent_path
    end
  end

  def show
    @dependent = Dependent.find_by(employee_id: Current.user.id, id: params[:id])
  end

  def edit
    @dependent = Dependent.find_by(employee_id: Current.user.id, id: params[:id])
  end

  def update
    @dependent = Dependent.find_by(employee_id: Current.user.id, id: params[:id])
    if @dependent.save
      redirect_to dependents_path( params[:id]), notice: "Successfully Updated Dependent details"
    else
      render action: 'edit'
    end
  end

  def dependent_params
    params.require(:dependent).permit(:dependent_name, :relationship_id, :dob, :is_active, :employee_id, :last_modified_by, :created_by, :action_type_id)
  end
  def dependent_params_edit
    params.require(:dependent).permit(:dependent_name, :relationship_id, :dob, :last_modified_by, :action_type_id)
  end
end
