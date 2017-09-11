class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show,:index,:edit,:update,:destroy]


  # GET /projects
  # GET /projects.json
  def index
    @user = current_user
    @projects = @user.projects.all
  end


  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @user = current_user
    @clients = @user.clientes
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @cliente = Cliente.find(params[:cliente_id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to root_path, notice: 'Enhorabuena! Tienes un nuevo proyecto. A trabajar!' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    @cliente = @project.cliente_id
    respond_to do |format|
      if @project.update(project_params)
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @cliente = @project.cliente
    @project.destroy
    respond_to do |format|
      format.html { redirect_to user_projects_url, notice: 'Proyecto borrado :(' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:user_id,:cliente_id,:title, :description, :condicion, :finished, :finishdate, :startdate, :price, :beneficio, :iva, :contactoprincipal, :category_id)
    end
end
