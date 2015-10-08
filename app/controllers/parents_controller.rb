class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  before_action :deny_access

  # GET /parents
  def index
    @parents = Parent.all
  end

  # GET /parents/1
  def show
  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      redirect_to @parent, notice: 'Parent was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /parents/1
  def update
    if @parent.update(parent_params)
      redirect_to @parent, notice: 'Parent was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /parents/1
  def destroy
    @parent.destroy
    redirect_to parents_url, notice: 'Parent was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parent_params
      params.require(:parent).permit(:name, :email, :string, :student_id, :password)
    end

    def logged_in?
      redirect_to login_path "Must be Logged in" unless session[:logged_in_teacher]
    end

    def deny_access
      redirect_to grades_path, notice: "Access Denied" unless session[:logged_in_teacher]
    end
end
