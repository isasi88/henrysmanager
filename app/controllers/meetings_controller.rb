class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @user = current_user
    @meetings = @user.meetings.all.where('date >= ?', Date.today).order('date ASC')
    @old_meetings = @user.meetings.all.where('date <= ?', Date.today).order('date ASC')
  end

  def old
    @user = current_user
    @old_meetings = @user.meetings.all.where('date <= ?', Date.today).order('date ASC')
    render "old_meetings"
  end


  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @user = current_user
    @meeting = current_user.meetings.build(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to root_path, notice: 'Enhorabuena! Tienes una nueva reunion.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to user_meetings_path(@user), notice: 'Editado correctamente.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Reunion borrada :(' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:user_id,:title, :note,:date, :location, :description)
    end
end
