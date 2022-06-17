class TeamMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team_member, only: %i[ show edit update destroy ]
  before_action :get_enterprise

  # GET /team_members or /team_members.json
  def index
    @team_members = @enterprise.team_members
  end

  # GET /team_members/1 or /team_members/1.json
  def show
  end

  # GET /team_members/new
  def new
    @team_member = @enterprise.team_members.build
  end

  # GET /team_members/1/edit
  def edit
    @enterprise = Enterprise.find(params[:enterprise_id])
    @team_member = @enterprise.team_members.find(params[:id])
  end

  # POST /team_members or /team_members.json
  def create
    @team_member = @enterprise.team_members.build(team_member_params)

    respond_to do |format|
      if @team_member.save
        format.html { redirect_to @enterprise, notice: "Team member was successfully created." }
        format.json { render :show, status: :created, location: @team_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_members/1 or /team_members/1.json
  def update
    respond_to do |format|
      if @team_member.update(team_member_params)
        format.html { redirect_to @enterprise, notice: "Team member was successfully updated." }
        format.json { render :show, status: :ok, location: @team_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_members/1 or /team_members/1.json
  def destroy
    @team_member.destroy
    respond_to do |format|
      format.html { redirect_to @enterprise, notice: "Team member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_enterprise
      @enterprise = Enterprise.find(params[:enterprise_id])
    end
    
    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_member_params
      params.require(:team_member).permit(:full_name, :position, :image, :bio, 
        :enterprise_id, :remove_image, :image_cache)
    end
end
