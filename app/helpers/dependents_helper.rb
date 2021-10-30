module DependentsHelper
  def dependentDetails(rid)
    if Current.user.marital_status_id == 1
      Dependent.where(employee_id: Current.user.id, relationship_id: [1,2])
    else
      Dependent.where(employee_id: Current.user.id, relationship_id: [rid])
    end
  end

  def dependentExistance(rid)
    Dependent.exists?(employee_id: Current.user.id, relationship_id: [rid])
  end

  def getdependentcount()
    Dependent.where("employee_id = ?", Current.user.id).count
  end

end
