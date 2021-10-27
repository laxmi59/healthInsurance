class SessionsController < ApplicationController
  def new;end
  def create
    @user = Employee.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.role_id == 1
        redirect_to admin_dashboard_path, notice: 'Admin Logged in successfully'
      else
        redirect_to welcome_path, notice: 'Employee Logged in successfully'
      end
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end
end
