class EmployeesController < ApplicationController
  def edit
    @emp = Employee.find(Current.user.id)
  end

  def update
    @emp = Employee.find(Current.user.id)
    @emp.attributes = emp_params
    if @emp.save(context: :contactdetails)
      redirect_to employee_path(Current.user.id), notice: "Successfully Updated your details"
    else
      render action: 'edit'
    end
  end

  def edit_personal
    @emp = Employee.find(Current.user.id)
  end
  def update_personal
    @emp = Employee.find(Current.user.id)
    @emp.attributes = emp_personal_params
    #puts @emp.inspect
    if @emp.save(context: :personal_details)
      redirect_to employee_path(Current.user.id), notice: "Successfully Updated your details"
    else
      render action: 'edit_personal'
    end
  end

  def update_parent_type
    @emp = Employee.find(Current.user.id)
    @emp.attributes = emp_parent_params
    #puts @emp.inspect
    if @emp.save()
      if(params[:parent_type] == 1)
        Dependent.where("employee_id = ? AND relationship_id in (?)", Current.user.id, [3,4]).delete_all
      else
        Dependent.where("employee_id = ? AND relationship_id in (?)", Current.user.id, [1,2]).delete_all
      end
      redirect_to welcome_path, notice: "Successfully Changed your Parent type"
    end
  end

  def show
    @emp = Employee.find(Current.user.id)
  end

  def emp_parent_params
    params.permit(:parent_type, :last_modified_by)
  end

  def emp_params
    params.require(:employee).permit(:phone_number, :location_id, :last_modified_by)
  end
  def emp_personal_params
    params.require(:employee).permit(:employee_name, :gender_id, :dob, :marital_status_id, :blood_group_id, :last_modified_by)
  end
end
