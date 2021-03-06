class Admin::EmployeesController < ApplicationController
  before_action :require_user_logged_in!
  def index

    @emps = Employee.where(nil)
    @emps = Employee.filter_by_optin(params[:optin]) if params[:optin].present?

    empids = helpers.pendingUsers() if params[:pending].present?
    @emps = Employee.filter_by_pending(empids) if params[:pending].present?

    @emps = helpers.getUsersBySrch(params[:srchquery]) if params[:srchquery].present?

  end

  def show
    @emp = Employee.find(params[:id])
  end

  def new
    @emp = Employee.new
  end

  def import_csv
    @emp = Employee.new
  end

  def import_csv_create
    if Employee.import(params[:employee][:file])
     redirect_to admin_employees_path, notice: "Employees uploaded successfully"
   else
     render admin_employee_path
   end
  end

  def create
    @emp = Employee.new(employee_params)
    #puts @emp.inspect
    if @emp.save
      redirect_to admin_employees_path, notice: "Successfully Created New Employee"
    else
      render new_admin_employee_path
    end
  end

  def employee_params
    params.require(:employee).permit(:email, :password, :password_confirmation, :role_id, :is_active, :last_modified_by, :employee_id, :job_title)
  end

  def edit
    @emp = Employee.find(params[:id])
  end

  def delete
    @emp = Employee.find(params[:id])
  end

  def export_csv
    @emps = Employee.where("role_id = ?", 2).includes(:role, :location, :blood_group, :marital_status, :gender)
    respond_to do |format|
      format.html
      format.csv{ send_data @emps.to_csv, filename: "Employee-#{Date.today}.csv"}
    end
  end
end
