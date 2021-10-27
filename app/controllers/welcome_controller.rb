class WelcomeController < ApplicationController
  def index
    #@policy = Policy.joins(:cycles).select("policies.name, cycles.cycle_year").where("cycles.cycle_year like ?","#{Time.now.year}-#{Time.now.next_year.strftime('%y')}")
    @policy = Policy.joins(:cycles).select("policies.id as policyId, policies.name, cycles.cycle_year, cycles.id as cycleId").where("cycles.cycle_year like ?","#{Time.now.year}-#{Time.now.next_year.strftime('%y')}")
    @dependent = Dependent.find_by(employee_id: Current.user.id, relationship_id: 1)
  end
end
