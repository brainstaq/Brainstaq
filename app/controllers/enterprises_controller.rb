class EnterprisesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [ :index, :show]
  # before_action :require_subscription, only: [:new]
  before_action :set_enterprise, only: [:show, :edit, :update, :destroy]

  ENTERPRISES_PER_PAGE = 9

  # GET /enterprises or /enterprises.json
  def index
    if params[:category].blank?
      @page = params.fetch(:page, 0).to_i 
      @next_page = @page + 1 if Enterprise.count >= 9
      @prev_page = @page - 1 if @page < 0
      @enterprises = Enterprise.offset(@page*ENTERPRISES_PER_PAGE).limit(ENTERPRISES_PER_PAGE).order(created_at: :desc)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @page = params.fetch(:page, 0).to_i 
      @next_page = @page + 1 if Enterprise.count >= 9
      @prev_page = @page - 1 if @page < 0
      @enterprises = Enterprise.where(category_id: @category_id).offset(@page*ENTERPRISES_PER_PAGE).limit(ENTERPRISES_PER_PAGE).order(created_at: :desc)
    end
  end

  def show
    @enterprise = Enterprise.find(params[:id])
    @business_plan = BusinessPlan.new
    @business_plans = @enterprise.business_plans
    @products_and_growth_rates = @business_plan.products_and_growth_rates
    @portfolios = @enterprise.portfolios
    @services = @enterprise.services
    @business_plan.enterprise_id = @enterprise.id

    render :show
  end

  # GET /enterprises/new
  def new
    if current_user.can_create_enterprise?
      @enterprise = current_user.enterprises.build
    else
      redirect_to enterprises_path, notice: "You have reached the maximum number of enterprises you can create"
    end
  end

  # GET /enterprises/1/edit
  def edit
  end

  # POST /enterprises or /enterprises.json
  def create
    @enterprise = current_user.enterprises.build(enterprise_params)
    # @enterprise = Enterprise.new(subscription_plan: current_subscription, user: current_user)

    respond_to do |format|
      if @enterprise.save
        current_user.increment!(:enterprise_count)
        format.html { redirect_to @enterprise, notice: "Brand was successfully created." }
        format.json { render :show, status: :created, location: @enterprise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enterprises/1 or /enterprises/1.json
  def update
    respond_to do |format|
      if @enterprise.update(enterprise_params)
        format.html { redirect_to @enterprise, notice: "Brand was successfully updated." }
        format.json { render :show, status: :ok, location: @enterprise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enterprises/1 or /enterprises/1.json
  def destroy
    @enterprise.destroy
    respond_to do |format|
      format.html { redirect_to enterprises_url, notice: "Brand was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def require_subscription
    unless current_user.subscribed?
      flash[:error] = "A subscription is required to create a brand."
      redirect_to new_transaction_path
    end
  end

  def set_enterprise
    @enterprise = Enterprise.find(params[:id])
  end
  

  def enterprise_params
    params.require(:enterprise).permit(:status, :name, :image, :remove_image, :image_cache, 
      :category_id, :user_id, :address, :email, :phone_number, 
      :country, :state, :city, :info, :facebook_url, :twitter_url, :instagram_url, :website_url)
  end
end
