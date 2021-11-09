class Admin::WelcomeController < ApplicationController
  def index
    #@employees = Employee.all
    @employees = aggregateOpinion(@opinion)
  end
  def aggregateOpinion(array)
    optin= EmployeeCycle.where(is_opted: 1,policy_id: 1).count
    optout= EmployeeCycle.where(is_opted: 2,policy_id: 1).count

    empids= EmployeeCycle.all.pluck(:employee_id)
    empids << 1
    pending= Employee.where("employees.id not in (?) ", empids).count
    totalUsers= Employee.where.not(id: 1).count

    result = [["Optin",0],["Optout",0],["Pending",0],["Users",0]]
    result[0][1] = optin
    result[1][1] = optout
    result[2][1] = pending
    result[3][1] = totalUsers
    return result
  end

end
