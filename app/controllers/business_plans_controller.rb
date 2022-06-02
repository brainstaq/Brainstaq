class BusinessPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :get_enterprise
  before_action :set_business_plan, only: %i[ show edit update destroy ]
  

  def index
    @business_plans = @enterprise.business_plans
  end

  def download
    @business_plan = BusinessPlan.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render :pdf => "#{@business_plan.enterprise.name}",
               :layout => "pdf",
               :template => "pdf/download_templates",
               :margin => { :top => 10, :bottom => 10, :left => 10, :right => 10},
               :viewport_size => '1280x1024',
               disposition: 'attachment'
      end
    end
  end
  
  def new
    @business_plan = @enterprise.business_plans.build
  end

  def edit
    # @enterprises = current_user.enterprises
  end

  def show
    @business_plan = BusinessPlan.find(params[:id])
  end

  def create
    @business_plan = @enterprise.business_plans.build(business_plan_params)

    respond_to do |format|
      if @business_plan.save
        format.html { redirect_to enterprise_business_plans_path(@enterprise), notice: "Business plan was successfully created" }
        format.json { render :show, status: :created, location: @business_plan }
      else
        format.html { render :new }
        format.json { render json: @business_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @business_plan.update(business_plan_params)
        format.html { redirect_to enterprise_business_plans_path(@enterprise), notice: "Business plan was successfully updated" }
        format.json { render :show, status: :ok, location: @business_plan }
      else
        format.html { render :edit }
        format.json { render json: @business_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business_plan.destroy
    respond_to do |format|
      format.html { redirect_to enterprise_business_plans_path(@enterprise), notice: "Business plan was successfully deleted" }
      format.json { head :no_content }
    end
  end

  private
  
  def get_enterprise
    @enterprise = Enterprise.find(params[:enterprise_id])
  end

  def set_business_plan
    @business_plan = @enterprise.business_plans.find(params[:id])
  end

  def business_plan_params
    params.require(:business_plan).permit(:executive_summary, :products_and_services, 
      :industry_analysis, :competition, :swot, :operations, :enterprise_id, 
      :marketing, :financial, :appendices, :milestones, :vision, :mission, :objectives, 
      :value_proposition)
  end
end
