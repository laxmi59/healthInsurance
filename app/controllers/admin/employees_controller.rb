class Admin::EmployeesController < ApplicationController
  before_action :require_user_logged_in!
  def index
    @emps = Employee.where("role_id = ?", 2).includes(:role, :location)
  end
  def show
    @emp = Employee.find(params[:id])
  end

  def new
    @emp = Employee.new
  end

  def create
    @emp = Employee.new(employee_params)
    puts @emp.inspect
    if @emp.save
      redirect_to admin_employees_path, notice: "Successfully Created New Employee"
    else
      render new_admin_employee_path
    end
  end

  def employee_params
    params.require(:employee).permit(:email, :password, :password_confirmation, :role_id, :is_active, :last_modified_by, :employee_id)

  end

  def edit
    @emp = Employee.find(params[:id])
  end

  def delete
    @emp = Employee.find(params[:id])
  end

  def export_csv
    @emps = Employee.where("role_id = ?", 2).includes(:role, :location, :blood_group)
    respond_to do |format|
      format.html
      format.csv{ send_data @emps.to_csv, filename: "Employee-#{Date.today}.csv"}
    end
  end
end
