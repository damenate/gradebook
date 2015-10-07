class DashboardController < ApplicationController

  def new

  end

  def create
    if request.post?
      t = Teacher.find_by_email(params[:email])
        if t.authenticate(params[:password])
          session[:logged_in] = true
          redirect_to new_teacher_path, notice: "Login Success"
        else
          redirect_to dashboard_new_path, notice: "Login Denied"
        end
      end
    end

  def destroy
    session[:logged_in] = false
    redirect_to dashboard_new_path
  end

end
