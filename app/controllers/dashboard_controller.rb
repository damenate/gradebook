class DashboardController < ApplicationController

  def new

  end

  def create
    if request.post?
      t = Teacher.find_by_email(params[:email])
        if t.authenticate(params[:password])
          session[:logged_in] = true
          redirect_to new_teacher_path, notice: "You did it!"
        else
          redirect_to dashboard_new_path, notice: "Go jump off a short ledge."
        end
      end
    end

  def destroy
    session[:logged_in] = false
    redirect_to dashboard_new_path
  end

end
