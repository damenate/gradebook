class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  before_action :deny_access
  # GET /teachers
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new#(teahcer_id: session[:user_id])
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to @teacher, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /teachers/1
  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @logged_in_teacher = Teacher.find_by_id(session[:teacher_id])
    end

    # Only allow a trusted parameter "white list" through.
    def teacher_params
      params.require(:teacher).permit(:name, :email, :password)
    end

    def logged_in?
      redirect_to login_path "Must be Logged in" unless session[:logged_in_teacher]
    end

    def deny_access
      redirect_to grades_path, notice: "Access Denied" unless session[:logged_in_teacher]
    end
end
