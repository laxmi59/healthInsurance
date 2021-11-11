module Admin::EmployeesHelper
  # def optinUsers
  #   EmployeeCycle.joins("INNER JOIN employees ON employees.id = employee_cycles.employee_id and employee_cycles.is_opted = 1 and employees.role_id = 2")
  # end
  # def optOutUsers
  #   EmployeeCycle.joins("INNER JOIN employees ON employees.id = employee_cycles.employee_id and employee_cycles.is_opted = 2 and employees.role_id = 2")
  # end
  def pendingUsers
    empids= EmployeeCycle.all.pluck(:employee_id)
    empids << 1
  end
  def getAllUsers
    Employee.where("role_id = ?", 2)
  end

  def getUsersBySrch(srchquery)
    if srchquery.is_a?(Integer) == true
      Employee.where("id LIKE ?", "%#{srchquery}%")
    elsif srchquery.is_a?(Integer) == false
      Employee.where("employee_name LIKE ?", "%#{srchquery}%")
    end
  end

  def employeePolicyData(eid)
    EmployeeCycle.find_by("employee_id = ?", eid)#.includes(:policy, :cycle, :top_up)
  end
end
