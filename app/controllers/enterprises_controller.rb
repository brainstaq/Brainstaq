class EnterprisesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [ :index, :show]
  before_action :check_quota, only: [:new]
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
    @team_members = @enterprise.team_members
    @products = @enterprise.products
    @portfolios = @enterprise.portfolios
    @services = @enterprise.services
    @business_plan.enterprise_id = @enterprise.id

    render :show
  end

  # GET /enterprises/new
  def new
    # @enterprise = Enterprise.new
    @enterprise = current_user.enterprises.build
    # @user = current_user
  end

  # GET /enterprises/1/edit
  def edit
  end

  # POST /enterprises or /enterprises.json
  def create
    @enterprise = current_user.enterprises.build(enterprise_params)

    respond_to do |format|
      if @enterprise.save
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
  # Use callbacks to share common setup or constraints between actions.
  def set_enterprise
    @enterprise = Enterprise.find(params[:id])
  end
  

  def check_quota
    if current_user.enterprises.count >= 3
      @quota_warning = "Maximum number of Brands reached!"
    end
  end

  # Only allow a list of trusted parameters through.
  def enterprise_params
    params.require(:enterprise).permit(:status, :name, :image, :remove_image, :image_cache, 
      :category_id, :user_id, :address, :email, :products, :services, :portfolios, :team_members, :phone_number, 
      :country, :state, :city, :info, :facebook_url, :twitter_url, :instagram_url, :website_url)
  end
end
