class EnterprisesController < ApplicationController
  skip_before_action :verify_authenticity_token
  #before_action :set_enterprise, only: %i[ show edit update destroy ]

  before_action :set_enterprise, only: [:activate_enterprise, :deactivate_enterprise, :show, :edit, :update, :destroy]

  # GET /enterprises or /enterprises.json
  def index
    @enterprises = Enterprise.all
  end

  def activate_enterprise
    @enterprise.update(status: 1)
    redirect_to @enterprise, notice: 'Enterprise was successfully activated'
  end

  def deactivate_enterprise
    @enterprise.update(status: 0)
    redirect_to @enterprise, notice: 'Enterprise was successfully deactivated'
  end

  # GET /enterprises/1 or /enterprises/1.json
  def show
    @enterprise = Enterprise.find(params[:id]) 
    render :show
  end

  # GET /enterprises/new
  def new
    @enterprise = Enterprise.new
    #@enterprise = current_user.enterprises.build
  end

  # GET /enterprises/1/edit
  def edit
  end

  # POST /enterprises or /enterprises.json
  def create
    @enterprise = Enterprise.new(enterprise_params)
    @enterprise.user_id = current_user.id if user_signed_in?
    #current_user.enterprise = @enterprise
    @enterprise.status = 0
    @enterprise.save

    respond_to do |format|
      if @enterprise.save
        format.html { redirect_to @enterprise, notice: "Enterprise was successfully created. Welcome to Brainstaq!" }
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
        format.html { redirect_to @enterprise, notice: "Enterprise was successfully updated." }
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
      format.html { redirect_to enterprises_url, notice: "Enterprise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enterprise_params
      params.require(:enterprise).permit(:status, :name,:image,:remove_image, :image_cache, :enterprise_category, :address, :email, :phone_number, :country, :state, :city, :info)
    end
end
