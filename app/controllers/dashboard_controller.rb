class DashboardController < ApplicationController

  def new
  end

  def create
    if request.post?
      t = Teacher.find_by_email(params[:email])
      rent = Parent.find_by_email(params[:email])
      s = Student.find_by_email(params[:email])
      if t && t.authenticate(params[:password])
        session[:logged_in_teacher] = true
        redirect_to teachers_path, notice: "Login Success"
      elsif s && s.authenticate(params[:password])
        session[:logged_in_student] = true
        redirect_to student_path(s.id), notice: "Login Success."
      elsif rent && rent.authenticate(params[:password])
        session[:logged_in_parent] =true
        redirect_to student_path(rent.s.id), notice: "Login Success"
      else
        redirect_to login_path, notice: "Login Denied"
      end
    end
  end

  def destroy
    session[:logged_in_teacher] = false
   session[:logged_in_student] = false
   session[:logged_in_parent] = false
    redirect_to login_path
  end

end
