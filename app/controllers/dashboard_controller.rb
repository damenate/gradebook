class DashboardController < ApplicationController

  def new

  end

  def create
        if request.post?
          teacher = Teacher.find_by_email(params[:email])
          parent = Parent.find_by_email(params[:email])
          student = Student.find_by_email(params[:email])
          if teacher && teacher.authenticate(params[:password])
            session[:logged_in_teacher] = true
            redirect_to teachers_path, notice: "You successfully logged in."
          elsif student && student.authenticate(params[:password])
            session[:logged_in_student] = true
            redirect_to student_path(student.id), notice: "You successfully logged in."
          elsif parent && parent.authenticate(params[:password])
            session[:logged_in_parent] = true
            redirect_to student_path(parent.student_id), notice: "You successfully logged in."
          else
            redirect_to login_path, notice: "Your login was not successful."
          end
        end
      end





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

          redirect_to login_path, notice: "Login Denied"
        end
      end
    end

  def destroy
    session[:logged_in_teacher] = false
    redirect_to login_path
  end

end
