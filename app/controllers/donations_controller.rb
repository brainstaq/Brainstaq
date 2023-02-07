class DonationsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :authenticate_user!

  def index
    @ideas = current_user.ideas.all.order(created_at: :desc)
    @donations = current_user.donations.order(created_at: :desc)
    @perk = Perk.find_by_id params[:perk]
  end
  
  def new
    @idea = current_user.ideas.build
    @idea = Idea.find_by_id params[:idea]
    @perk = Perk.find_by_id params[:perk_id]
  end

  # def create
  #   @donor_id = params[:donor_id]
  #   @email = params[:email]
  #   @idea_id = params[:idea_id]
  #   @amount = params[:amount]

  #   @donation = current_user.donations.build(
  #     :amount => @amount,
  #     :donor_id => @donor_id,
  #     :idea_id => @idea_id,
  #     # :perk_id => @perk_id,
  #     :response_reference => @response_reference
  #   )

  #   @donor_id = current_user.id
  #   @idea_id = Idea.find_by_id params[:idea]
  #   @perk = Perk.find_by_id params[:perk_id]

  #   if @donation.save!
  #     @idea = @donation.idea
  #     @perk = Perk.find_by_id(params[:perk_id])
  #     @donation.perk if @donation.perk
  #     render json: { success: true}
  #   else
  #     render :new
  #   end
  # end

  def create
    @donation = current_user.donations.create(
      :amount => params[:amount],
      :donor_id => params[:donor_id],
      :idea_id => params[:idea_id],
      :perk_id => params[:perk_id]
    )
    if @donation.save
      @idea = @donation.idea
      @perk = Perk.find_by_id(params[:perk_id])
      @donation.perk if @donation.perk
      render json: { success: true}
    # else
    #   render :new
    end
  end

  # def show
  #   @donation = Donation.find(params[:id])
  # end

  def donor
    @donor ||= Donation.find_by(user: donor_id, idea: idea_id)
  end
  
  private

  def donation_params
    params.permit(:idea_id, :donor_id, :response_reference, :amount, :email, :phone)
  end

  def donations
    params.permit(:idea_id, :donor_id, :response_reference, :amount)
  end
end