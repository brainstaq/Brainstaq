class FinancialPlansController < ApplicationController
  before_action :set_financial_plan, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :get_enterprise

  # GET /financial_plans or /financial_plans.json
  def index
    @financial_plans = @enterprise.financial_plans
  end

  # GET /financial_plans/1 or /financial_plans/1.json
  def show
    @financial_plan = FinancialPlan.find(params[:id])

    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render pdf: "Financial Plan - #{@enterprise.name}",
    #           type: 'application/pdf',
    #           layout: 'financial_plan_pdf.html.erb',
    #           page_size: 'A4',
    #           template: 'financial_plans/show.html.erb',
    #           margin: { :top => 20, :bottom => 10, :left => 20, :right => 20},
    #           viewport_size: '1280x1024',
    #           lowquality: true,
    #           zoom: 1,
    #           dpi: 75,
    #           orientation: 'Landscape',
    #           disposition: 'inline'
    #   end
    # end
  end

  # GET /financial_plans/new
  def new
    # @financial_plan = FinancialPlan.new
    @financial_plan = @enterprise.financial_plans.build
  end

  # GET /financial_plans/1/edit
  def edit
  end

  # POST /financial_plans or /financial_plans.json
  def create
    @financial_plan = @enterprise.financial_plans.build(financial_plan_params)

    respond_to do |format|
      if @financial_plan.save
        format.html { redirect_to enterprise_financial_plans_path(@financial_plan), notice: "Financial plan was successfully created." }
        format.json { render :show, status: :created, location: @financial_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @financial_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_plans/1 or /financial_plans/1.json
  def update
    respond_to do |format|
      if @financial_plan.update(financial_plan_params)
        format.html { redirect_to enterprise_financial_plans_path(@financial_plan), notice: "Financial plan was successfully updated." }
        format.json { render :show, status: :ok, location: @financial_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @financial_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_plans/1 or /financial_plans/1.json
  def destroy
    @financial_plan.destroy

    respond_to do |format|
      format.html { redirect_to enterprise_financial_plans_path, notice: "Financial plan was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_plan
      @financial_plan = FinancialPlan.find(params[:id])
    end

    def get_enterprise
      @enterprise = Enterprise.find(params[:enterprise_id])
    end

    # Only allow a list of trusted parameters through.
    def financial_plan_params
      params.require(:financial_plan).permit(:user_id, :company_tax_rate, :bank_interest_rate, :inflation_rate, 
        :salary_benefits, :enterprise_id, :receivable_days, :payable_days, :inventory_days, :savings, :grants, 
        :equity, :debt, :equity_injection_four, :equity_injection_three, :equity_injection_two, :equity_injection_one, 
        costs_growth_rates_attributes: [:id, :_destroy, :item_name, :cost_growth_rate_one, :cost_growth_rate_two,
          :cost_growth_rate_three, :cost_growth_rate_four, :cost_growth_rate_five,],
        debt_financings_attributes: [:id, :_destroy, :loan_year, :loan_amount, :repayment_period, :loan_end],
        depreciation_items_attributes: [:id, :_destroy, :item_name, :rate],
        direct_costs_attributes: [:id, :_destroy, :item, :cost],
        fixed_costs_attributes: [:id, :_destroy, :item, :cost],
        positions_attributes: [:id, :_destroy, :title, :number_of_employees_one, :number_of_employees_two, 
          :number_of_employees_three, :number_of_employees_four, :number_of_employees_five,  :base_annual_salary],
        revenue_growth_rates_attributes: [:id, :_destroy, :product, :sales_volume_growth_rate_one, 
          :sales_volume_growth_rate_two, :sales_volume_growth_rate_three, :sales_volume_growth_rate_four,
          :sales_volume_growth_rate_five, :unit_price_growth_rate_one, :unit_price_growth_rate_two, 
          :unit_price_growth_rate_three, :unit_price_growth_rate_four, :unit_price_growth_rate_five, :base_product_price, 
          :monthly_sales_volume],
        seasonal_estimates_attributes: [:id, :_destroy, :product, :sales_percentage_one, :sales_percentage_two, 
          :sales_percentage_three, :sales_percentage_four, :sales_percentage_five, :sales_percentage_six, 
          :sales_percentage_seven, :sales_percentage_eight, :sales_percentage_nine, :sales_percentage_ten, 
          :sales_percentage_eleven, :sales_percentage_twelve],
        startup_costs_attributes: [:id, :_destroy, :item_name, :baseline_cost])
    end
end
