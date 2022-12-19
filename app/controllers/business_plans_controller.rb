class BusinessPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :get_enterprise
  before_action :set_business_plan, only: %i[ show edit update destroy ]
  before_action :find_business_plan, only: [:show, :edit, :update, :destroy]
  # before_action :check_quota, only: [:new]
  

  def index
    @business_plans = @enterprise.business_plans
  end

  # def download
  #   @business_plan = BusinessPlan.find(params[:id])
  # end
  
  def new
    @business_plan = @enterprise.business_plans.build
  end

  def edit
    # @enterprises = current_user.enterprises
  end

  def show
    @business_plan = BusinessPlan.find(params[:id])
    @milestones = Milestone.all
    @products_and_growth_rates = ProductsAndGrowthRate.all
    @depreciation_items = DepreciationItem.all
    @startup_costs = StartupCost.all
    @total_cost = @startup_costs.sum(:baseline_cost)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Business_Plan_for_#{@business_plan.enterprise.name}",
              type: 'application/pdf',
              layout: 'pdf.html.erb',
              page_size: 'A4',
              template: 'business_plans/business_plan.html.erb',
              margin: { :top => 20, :bottom => 10, :left => 20, :right => 20},
              viewport_size: '1280x1024',
              lowquality: true,
              zoom: 1,
              dpi: 75,
              orientation: 'Portrait',
              disposition: 'inline'
      end
    end
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

  def financials
    @business_plan = @enterprise.business_plans.build
    @depreciation_items = DepreciationItem.all
    @startup_costs = StartupCost.all
    @total_cost = @startup_costs.sum(:baseline_cost)
    @company_tax_rate = @business_plan.company_tax_rate
  end

  private
  
  def get_enterprise
    @enterprise = Enterprise.find(params[:enterprise_id])
  end

  def set_business_plan
    # @business_plan = @enterprise.business_plans.find(params[:id])
    @business_plan = BusinessPlan.find(params[:id])
  end

  def find_business_plan
    # @business_plan = @enterprise.business_plans.find(params[:id])
    @business_plan = BusinessPlan.find(params[:id])
  end

  # def check_quota
  #   if @enterprise.business_plans.count >= 1
  #     @quota_warning = "Maximum number of Business Plans reached!"
  #   end
  # end

  def business_plan_params
    params.require(:business_plan).permit(
      :executive_summary, 
      :products_and_services, 
      :industry_analysis, 
      :competition, 
      :swot, 
      :operations, 
      :enterprise_id, 
      :marketing, 
      :financial, 
      :management, 
      :appendices, 
      :vision, 
      :mission, 
      :objectives, 
      :value_proposition,
      :company_tax_rate, 
      :bank_interest_rate, 
      :inflation_rate, 
      :salary_benefits,
      :receivable_days, 
      :payable_days, 
      :inventory_days, 
      :savings, 
      :grants, 
      :equity, 
      :debt, 
      :equity_injection_four,         
      :equity_injection_three, 
      :equity_injection_two, 
      :equity_injection_one,
        costs_growth_rates_attributes: [
          :id, :_destroy, :cost_item, :cost_growth_rate_one, :cost_growth_rate_two,
          :cost_growth_rate_three, :cost_growth_rate_four, :cost_growth_rate_five 
        ],
        debt_financings_attributes: [
          :id, :_destroy, :loan_year, :loan_amount, :repayment_period, :loan_end
        ],
        depreciation_items_attributes: [
          :id, :_destroy, :item_name, :rate
        ],
        direct_costs_attributes: [
          :id, :_destroy, :item, :cost
        ],
        fixed_costs_attributes: [
          :id, :_destroy, :item, :cost
        ],
        marketing_expenses_attributes: [
          :id, :_destroy, :item_name, :cost
        ],
        milestones_attributes: [
          :id, :_destroy, :milestone, :done_by, :cost, :date_schedule
        ],
        positions_attributes: [
          :id, :_destroy, :title, :number_of_employees_one, :number_of_employees_two, :number_of_employees_three, 
          :number_of_employees_four, :number_of_employees_five, :base_annual_salary
        ],
        products_and_growth_rates_attributes: [
          :id, :_destroy, :sales_volume_growth_rate_one, :sales_volume_growth_rate_two, 
          :sales_volume_growth_rate_three, :sales_volume_growth_rate_four,
          :sales_volume_growth_rate_five, :unit_price_growth_rate_one, :unit_price_growth_rate_two, 
          :unit_price_growth_rate_three, :unit_price_growth_rate_four, :unit_price_growth_rate_five, 
          :monthly_sales_volume, :product_name, :product_image, :description, :sales_percentage_one, 
          :sales_percentage_two, :sales_percentage_three, :sales_percentage_four, :sales_percentage_five, 
          :sales_percentage_six, :sales_percentage_seven, :sales_percentage_eight, :sales_percentage_nine, 
          :sales_percentage_ten, :sales_percentage_eleven, :sales_percentage_twelve, :base_product_price
        ],
        
        startup_costs_attributes: [
          :id, :_destroy, :item_name, :baseline_cost
        ],
        swots_attributes: [
          :id, :_destroy, :swot_type, :description
        ],
        team_members_attributes: [
          :id, :_destroy, :full_name, :image, :bio
        ]
    )
  end 
end
