class DependentsController < ApplicationController
  def index
    @dependents = Dependent.where("employee_id = ?", Current.user.id)
  end

  # def new
  #   @dependent = Dependent.new
  # end
  #
  # def create
  #   @dependent = Dependent.new(dependent_params)
  #   #puts @dependent.inspect
  #   if @dependent.save
  #     redirect_to dependents_path, notice: "Successfully Created New Dependent"
  #   else
  #     @cycles = Cycle.all
  #     render new_dependent_path
  #   end
  # end

  def new
    @dependent = Dependent.new
    respond_to do |format|
      format.js { render partial: "new", locals: {dependent: @dependent}}
      format.html {
        @dependent = Dependent.find_by(employee_id: Current.user.id)
      }
    end
  end

  def create
    @dependent = Dependent.new(dependent_params)
    puts @dependent.inspect
    if @dependent.save
      respond_to do |format|
        format.js {
          redirect_to welcome_path, notice: "Successfully Created New Dependent"
        }
        format.html {
          redirect_to dependents_path, notice: "Successfully Created New Dependent"
        }
      end
    else
      respond_to do |format|
        format.js {
         render partial: "new_modal_error", locals: {dependent: @dependent}
        }
        format.html {
          render new_dependent_path
        }
      end
    end
  end

  def show
    @dependent = Dependent.find_by(employee_id: Current.user.id, id: params[:id])
  end

  # def edit
  #   @dependent = Dependent.find_by(employee_id: Current.user.id, id: params[:id])
  # end
  #
  def edit
    @dependent = Dependent.find(params[:id])
    respond_to do |format|
      format.js { render partial: "edit", locals: {dependent: @dependent}}
      format.html {
        @dependent = Dependent.find_by(employee_id: Current.user.id, id: params[:id])
      }
    end
  end

  def update
   @dependent = Dependent.find_by(employee_id: Current.user.id, id: params[:id])
   @dependent.attributes = dependent_params_edit
   #puts @dependent.inspect
    if @dependent.save
      respond_to do |format|
        format.js {
          redirect_to welcome_path, notice: "Successfully Updated Dependent details"
        }
        format.html {
          redirect_to dependents_path, notice: "Successfully Updated Dependent details"
        }
      end
    else
      respond_to do |format|
        format.js {
         render partial: "edit_modal_error", locals: {dependent: @dependent}
        }
        format.html {
          render action: 'edit'
        }
      end
      #render action: 'edit'
    end
  end




  def dependent_params
    params.require(:dependent).permit(:dependent_name, :relationship_id, :dob, :is_active, :employee_id, :last_modified_by, :created_by, :action_type_id)
  end
  def dependent_params_edit
    params.require(:dependent).permit(:dependent_name, :relationship_id, :dob, :last_modified_by, :action_type_id)
  end
end
