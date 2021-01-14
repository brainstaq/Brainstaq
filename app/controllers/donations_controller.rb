class DonationsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @donations = Donation.all
  end
  
  def new
    @idea = Idea.find(params[:idea])
    @user = current_user
    @donation = Donation.new
    @donation.donor_id = current_user.id
  end

  def create
    @donation = current_user.donations.build(donation_params)
    if @donation.save
      render :show
    end
  end

  def show
    @donation = Donation.find(params[:id])
    render :show
  end

  def receive
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
    else
      # application/x-www-form-urlencoded
      data = params.as_json
    end

    # save_donation_params(params)
    render status: 200, json: {}.to_json
  end

  private

  def donation_params
    params.permit(:donation_id, :user_id, :perk_id, :idea_id, :donor_id, :reference, :date, :amount, :phone, :first_name, :last_name, 
      perks_attributes: [:id, :_destroy, :title, :description, :amount, :quantity])
  end
 end