class DonationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @donations = Donation.all
  end

  # def new
  #   @donation = Donation.new
  # end

  def new
    @idea = Idea.find(params[:idea])
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(donation_params)
    
    if @donation.save(contribution_params)
      render :show
    else
      render json: @donation.errors.full_messages, status: 442
    end
  end

  def show
    @donation = Donation.find(params[:id])
    render :show
  end

  # def create
  #   @idea = Idea.find(params[:idea])
  #   donation = Donation.new(donation_params)
  #   if donation.save
  #     redirect_to donations_path
  #   else
  #     flash[:notice] = "Oops!"
  #     redirect_to new_donation_path
  #   end
  # end


  # def set_donation
  #   @donation = Donation.find(params[:id])
  # end

  # def create
  #   @idea = Idea.find(params[:idea]) 
  # end

  private

  def donation_params
    params.require(:donation).permit(:donor_id, :perk_id, :idea_id, :amount, :date)
  end

 end
