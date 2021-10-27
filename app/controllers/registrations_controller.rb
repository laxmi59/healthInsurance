class RegistrationsController < ApplicationController
  def new
    @emp = Employee.new
  end
  def create
    @emp = Employee.new(employee_params)
    if @emp.save
      redirect_to root_path, notice: "Successfully Created New Employee"
    else
      render new
    end
  end

  def employee_params
    params.require(:employee).permit(:email, :password, :password_confirmation, :role_id)
  end
end
