module Admin::EmployeesHelper
  def optinUsers
    EmployeeCycle.joins("INNER JOIN employees ON employees.id = employee_cycles.employee_id and employee_cycles.is_opted = 1").count
    #EmployeeCycle.joins(:employees).count
  end
  def optOutUsers
    EmployeeCycle.joins("INNER JOIN employees ON employees.id = employee_cycles.employee_id and employee_cycles.is_opted = 2").count
  end
  def pendingUsers
    empids= EmployeeCycle.all.pluck(:employee_id)
    empids << 1
    Employee.where("employees.id not in (?) ", empids).count
  end
  def getAllUsers
    Employee.where.not(id: 1).count
  end
  def getAllUsersChart
    @employees = Employee.all
  end
  def optinUsersChart
    EmployeeCycle.joins("INNER JOIN employees ON employees.id = employee_cycles.employee_id").group("employee_cycles.policy_id")
  end

  def employeePolicyData(eid)
    EmployeeCycle.find_by("employee_id = ?", eid)#.includes(:policy, :cycle, :top_up)
  end
end
