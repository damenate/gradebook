class DashboardController < ApplicationController

  def new

  end

  def create
    if request.post?
      t = Teacher.find_by_email(params[:email])
        if t && t.authenticate(params[:password])
          session[:logged_in_teacher] = true
          redirect_to teachers_path, notice: "Login Success"
        else
          redirect_to login_path, notice: "Login Denied"
        end
      end
    end

  def destroy
    session[:logged_in_teacher] = false
    redirect_to login_path
  end

end
