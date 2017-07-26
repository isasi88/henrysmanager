class NegociationsController < ApplicationController
  before_action :set_negociation, only: [:show, :edit, :update, :destroy]

  # GET /negociations
  # GET /negociations.json
  def index
    @negociations = Negociation.all
  end

  # GET /negociations/1
  # GET /negociations/1.json
  def show
  end

  # GET /negociations/new
  def new
    @negociation = Negociation.new
  end

  # GET /negociations/1/edit
  def edit
  end

  # POST /negociations
  # POST /negociations.json
  def create

    @user = current_user
    @negociation = current_user.negociations.build(negociation_params)

    respond_to do |format|
      if @negociation.save
        format.html { redirect_to root_path, notice: 'Negociation was successfully created.' }
        format.json { render :show, status: :created, location: @negociation }
      else
        format.html { render :new }
        format.json { render json: @negociation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /negociations/1
  # PATCH/PUT /negociations/1.json
  def update
    respond_to do |format|
      if @negociation.update(negociation_params)
        format.html { redirect_to @negociation, notice: 'Negociation was successfully updated.' }
        format.json { render :show, status: :ok, location: @negociation }
      else
        format.html { render :edit }
        format.json { render json: @negociation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /negociations/1
  # DELETE /negociations/1.json
  def destroy
    @negociation.destroy
    respond_to do |format|
      format.html { redirect_to negociations_url, notice: 'Negociation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_negociation
      @negociation = Negociation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def negociation_params
      params.require(:negociation).permit(:user_id,:title, :description, :telephone, :email, :business, :state)
    end
end
