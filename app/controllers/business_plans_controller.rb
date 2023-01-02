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
    @positions = Position.all
    @products_and_growth_rates = ProductsAndGrowthRate.all
    @total_cost = (
      @business_plan.land + @business_plan.rent +
      @business_plan.office_supplies + @business_plan.equipment +
      @business_plan.vehicles + @business_plan.utilities +
      @business_plan.opening_inventory + @business_plan.capital + 
      @business_plan.contingency
    )

    @loan_year = @business_plan.loan_year
    @repayment_period = @business_plan.repayment_period
    @loan_end = @loan_year + @repayment_period
    @loan_amount = @business_plan.debt * 0.01 * @total_cost
    @equity = @business_plan.equity
    @calculated_equity = @total_cost * (@equity / 100.0)
    @equity_injection_one = @business_plan.equity_injection_one
    @equity_injection_two = @business_plan.equity_injection_two
    @equity_injection_three = @business_plan.equity_injection_three
    @equity_injection_four = @business_plan.equity_injection_four

    @calculated_equity_2 = @calculated_equity + @equity_injection_one
    @calculated_equity_3 = @calculated_equity_2 + @equity_injection_two
    @calculated_equity_4 = @calculated_equity_3 + @equity_injection_three
    @calculated_equity_5 = @calculated_equity_4 + @equity_injection_four

    @opening_debt_1 = 0
    @addition_debt_1 = if @loan_year == 2 then @loan_amount else 0 end
    @principal_repayment_1 = if 2 >= @loan_year && 2 < @loan_end then (@loan_amount / @repayment_period) else 0 end
    @closing_debt_1 = (0 + @loan_amount) - (@loan_amount / @repayment_period)
    @interest_expense_1 = (0 + @loan_amount) * @business_plan.bank_interest_rate * 0.01
    @total_debt_1 = @principal_repayment_1 + @interest_expense_1

    @opening_debt_2 = @closing_debt_1
    @addition_debt_2 = if @loan_year == 3 then @loan_amount else 0 end
    @principal_repayment_2 = if 3 >= @loan_year && 3 < @loan_end then (@loan_amount / @repayment_period) else 0 end
    @closing_debt_2 = (@opening_debt_2 + @addition_debt_2) - @principal_repayment_2
    @interest_expense_2 = (@opening_debt_2 + @addition_debt_2) * @business_plan.bank_interest_rate * 0.01
    @total_debt_2 = @principal_repayment_2 + @interest_expense_2

    @opening_debt_3 = @closing_debt_2
    @addition_debt_3 = if @loan_year == 4 then @loan_amount else 0 end
    @principal_repayment_3 = if 4 >= @loan_year && 4 < @loan_end then (@loan_amount / @repayment_period) else 0 end
    @closing_debt_3 = (@opening_debt_3 + @addition_debt_3) - @principal_repayment_3
    @interest_expense_3 = (@opening_debt_3 + @addition_debt_3) * @business_plan.bank_interest_rate * 0.01
    @total_debt_3 = @principal_repayment_3 + @interest_expense_3

    @opening_debt_4 = @closing_debt_3
    @addition_debt_4 = if @loan_year == 5 then @loan_amount else 0 end
    @principal_repayment_4 = if 5 >= @loan_year && 5 < @loan_end then (@loan_amount / @repayment_period) else 0 end
    @closing_debt_4 = (@opening_debt_4 + @addition_debt_4) - @principal_repayment_4
    @interest_expense_4 = (@opening_debt_4 + @addition_debt_4) * @business_plan.bank_interest_rate * 0.01
    @total_debt_4 = @principal_repayment_4 + @interest_expense_4

    @opening_debt_5 = @closing_debt_4
    @addition_debt_5 = if @loan_year == 6 then @loan_amount else 0 end
    @principal_repayment_5 = if 6 >= @loan_year && 6 < @loan_end then (@loan_amount / @repayment_period) else 0 end
    @closing_debt_5 = (@opening_debt_5 + @addition_debt_5) - @principal_repayment_5
    @interest_expense_5 = (@opening_debt_5 + @addition_debt_5) * @business_plan.bank_interest_rate * 0.01
    @total_debt_5 = @principal_repayment_5 + @interest_expense_5

    @raw_material_cost = @business_plan.raw_material_cost
    @direct_labour_cost = @business_plan.direct_labour_cost
    @factory_overhead = @business_plan.factory_overhead
    @inbound_transport = @business_plan.inbound_transport
    @total_direct_cost = (
      @business_plan.raw_material_cost + @business_plan.direct_labour_cost +
      @business_plan.factory_overhead + @business_plan.inbound_transport)
      
    @total_fixed_cost = (
      @business_plan.admin_cost + @business_plan.website_cost +
      @business_plan.telephone_cost + @business_plan.transport_cost +
      @business_plan.salaries_cost + @business_plan.rent_cost +
      @business_plan.utilities_cost + @business_plan.marketing_cost + 
      @business_plan.misc
    )

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

  def loan_end
    self.loan_end = (self.loan_year + self.repayment_period)
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
      :executive_summary, :products_and_services, :industry_analysis, :competition, :swot, :operations, :enterprise_id, 
      :marketing, :financial, :management, :appendices, :vision, :mission, :objectives, :value_proposition,:company_tax_rate, 
      :bank_interest_rate, :inflation_rate, :receivable_days, :payable_days, :inventory_days, :savings, 
      :grants, :equity, :debt, :loan_year, :repayment_period, :raw_material_cost, :direct_labour_cost, 
      :factory_overhead, :inbound_transport, :salaries_cost, :rent_cost, :utilities_cost, :marketing_cost, :admin_cost, 
      :website_cost, :telephone_cost, :transport_cost, :misc, :equity_injection_four, :equity_injection_three, 
      :equity_injection_two, :equity_injection_one, :land, :rent, :office_supplies, :equipment, :vehicles, :utilities,
      :opening_inventory, :capital, :contingency, :rent_cgr1,
      :direct_cgr1,
      :utilities_cgr1,
      :marketing_cgr1,
      :maintenance_cgr1,
      :transport_cgr1,
      :phone_cgr1,
      :admin_cgr1,
      :rent_cgr2,
      :direct_cgr2,
      :utilities_cgr2,
      :marketing_cgr2,
      :maintenance_cgr2,
      :transport_cgr2,
      :phone_cgr2,
      :admin_cgr2,
      :rent_cgr3,
      :direct_cgr3,
      :utilities_cgr3,
      :marketing_cgr3,
      :maintenance_cgr3,
      :transport_cgr3,
      :phone_cgr3,
      :admin_cgr3,
      :rent_cgr4,
      :direct_cgr4,
      :utilities_cgr4,
      :marketing_cgr4,
      :maintenance_cgr4,
      :transport_cgr4,
      :phone_cgr4,
      :admin_cgr4,
      :misc_cgr1,
      :misc_cgr2,
      :misc_cgr3,
      :misc_cgr4,
      :misc_cgr5,
      :rent_cgr5,
      :direct_cgr5,
      :utilities_cgr5,
      :marketing_cgr5,
      :maintenance_cgr5,
      :transport_cgr5,
      :phone_cgr5,
      :admin_cgr5, :dep_building, :dep_furniture, :dep_installations, :dep_machinery, :dep_vehicles,
        marketing_expenses_attributes: [
          :id, :_destroy, :item_name, :cost
        ],
        milestones_attributes: [
          :id, :_destroy, :milestone, :done_by, :cost, :date_schedule
        ],
        positions_attributes: [
          :id, :_destroy, :title, :number_of_employees_one, :number_of_employees_two, :number_of_employees_three, 
          :number_of_employees_four, :salary_benefits, :salaries_cgr1, :salaries_cgr2, :salaries_cgr3, :salaries_cgr4, 
          :salaries_cgr5, :number_of_employees_five, :base_annual_salary, :full_name, :image, :bio
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
        swots_attributes: [
          :id, :_destroy, :swot_type, :description
        ]
    )
  end 
end
