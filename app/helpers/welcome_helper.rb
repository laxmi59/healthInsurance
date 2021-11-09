module WelcomeHelper
  CYCLEYEAR = ['2021-22'].freeze

  def optinTopup(cid)
    TopUp.where(cycle_id: cid)
  end

  def getPolicyName(pid)
    Policy.find(pid).name
  end

  def getCycleName(cid)
    Cycle.find(cid).cycle_year
  end

  def optinTopupAmount(cid)
    TopUp.find_by(cycle_id: cid)
  end

  def optinTopupofEmployee()
    EmployeeCycle.find_by(employee_id: Current.user.id)
  end

  def getActionTypes()
    ActionType.all()
  end
end
