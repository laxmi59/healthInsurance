class Admin::PoliciesController < ApplicationController
  before_action :require_user_logged_in!
  def index
    @policies = Policy.all
  end

  def new
    @policy = Policy.new
  end

  def create
    @policy = Policy.new(policy_params)
    #puts @cycle.inspect
    if @policy.save
      redirect_to admin_policies_path, notice: "Successfully Created New Policy"
    else
      render new_admin_policy_path
    end
  end

  def destroy
    @policy = Policy.find(params[:id])
    @policy.destroy
    redirect_to admin_policies_path
  end

  def policy_params
    params.require(:policy).permit(:name, :last_modified_by)
  end
end
