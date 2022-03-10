class BusinessPlansController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_enterprise
  before_action :set_business_plan, only: %i[ show edit update destroy ]
  

  def new
    # @business_plan = @enterprise.business_plan.build
  end

  def edit
    @business_plan = BusinessPlan.find(params[:id])
  end

  def show
    @business_plan = BusinessPlan.find(params[:id])
  end

  def create
    @business_plan = @enterprise.business_plan.create(business_plan_params)

    if @business_plan.save!
      redirect_to enterprise_path(@business_plan.enterprise), notice: "Business plan was successfully created"
    else
      render action: 'new'
    end
  end

  def update
    if @business_plan.update(business_plan_params)
      redirect_to (@business_plan.enterprise), notice: 'Business plan was successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @business_plan.destroy

    redirect_to @enterprise, notice: 'Business plan was successfully deleted'
  end

  private
    # def set_enterprise
    #   @enterprise = current_user.enterprises.find(params[:enterprise_id])
    # end

    def set_business_plan
      @business_plan = BusinessPlan.find(params[:id])
    end

    def business_plan_params
      params.require(:business_plan).permit(:executive_summary, :products_and_services, 
        :industry_analysis, :competition, :swot, :operations, :enterprise_id, 
        :marketing, :financial, :appendices, :milestones, :vision, :mission, :objectives, 
        :value_proposition)
    end
end
