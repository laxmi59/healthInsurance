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

  def getalldependents()
    Dependent.where("employee_id = ?", Current.user.id).includes(:relationship)
  end

  def getRelationType(rid)
    Relationship.find(rid).name
  end

  def getRelationTypeSelect(rid)
    Relationship.where(id: rid)
  end

  def dependentKidExistance(dob)
    Dependent.exists?(employee_id: Current.user.id, dob: [dob])
  end

  # def getdependentKidcount()
  #   kidcount = Dependent.where(employee_id: Current.user.id, relationship_id: [6,7])
  #   if kidcount.count == 2
  #     #kid = Dependent.where(employee_id: Current.user.id, relationship_id: [6,7]).first
  #     #kid2 = Dependent.where(employee_id: Current.user.id, relationship_id: [6,7]).last
  #     result = kidcount[0].dob == kidcount[1].dob ? false : true
  #   end
  # end
end
