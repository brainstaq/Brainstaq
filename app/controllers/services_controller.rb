class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service, only: %i[ show edit update destroy ]
  before_action :get_enterprise

  # GET /services or /services.json
  def index
    @services = @enterprise.services
  end

  # GET /services/1 or /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = @enterprise.services.build
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services or /services.json
  def create
    @service = @enterprise.services.build(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to enterprise_path(@enterprise), notice: "Service was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to enterprise_path(@enterprise), notice: "Service was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to enterprise_path(@enterprise), notice: "Service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_enterprise
      @enterprise = Enterprise.find(params[:enterprise_id])
    end
    
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:title, :description, :image, :enterprise_id)
    end
end
