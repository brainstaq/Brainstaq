class BusinessPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business_plan, only: %i[ show edit update destroy ]

  # GET /business_plans or /business_plans.json
  def index
    @business_plans = BusinessPlan.all
  end

  # GET /business_plans/1 or /business_plans/1.json
  def show
  end

  # GET /business_plans/new
  def new
    @business_plan = BusinessPlan.new
  end

  # GET /business_plans/1/edit
  def edit
  end

  # POST /business_plans or /business_plans.json
  def create
    # @business_plan = BusinessPlan.new(business_plan_params)

    # respond_to do |format|
    #   if @business_plan.save
    #     format.html { redirect_to @business_plan, notice: "Business plan was successfully created." }
    #     format.json { render :show, status: :created, location: @business_plan }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @business_plan.errors, status: :unprocessable_entity }
    #   end
    # end

    @enterprise = Enterprise.find(params[:enterprise_id]) #finds the idea with the associated idea_id
    @business_plan = @enterprise.business_plans.create(business_plan_params) # creates the comment on the idea passing in params
    @business_plan.user_id = current_user.id if current_user #assigns logged in user's ID to comment
    @business_plan.save!

    redirect_to business_plan_path(@business_plan.enterprise), notice: "Your business plan was successfully created."
  end

  # PATCH/PUT /business_plans/1 or /business_plans/1.json
  def update
    respond_to do |format|
      if @business_plan.update(business_plan_params)
        format.html { redirect_to @business_plan, notice: "Business plan was successfully updated." }
        format.json { render :show, status: :ok, location: @business_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_plans/1 or /business_plans/1.json
  def destroy
    @business_plan.destroy
    respond_to do |format|
      format.html { redirect_to business_plans_url, notice: "Business plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_plan
      @business_plan = BusinessPlan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_plan_params
      params.require(:business_plan).permit(:executive_summary, :products_and_services, 
        :industry_analysis, :competition, :swot, :operations, :user_id, :enterprise_id, 
        :marketing, :financial, :appendices, :milestones, :vision, :mission, :objectives, 
        :valur_proposition)
    end
end
