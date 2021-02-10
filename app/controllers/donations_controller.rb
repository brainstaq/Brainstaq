class DonationsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :authenticate_user!

  def index
    @donations = Donation.all
  end
  
  def new
    @idea = current_user.ideas.build
    @user = current_user
    @donation = Donation.new
    @donation.donor_id = current_user.id
    @donation = current_user.donations.build
  end

  def create
    @response_reference = params[:response_reference]
    @donor_id = params[:donor_id]
    @email = params[:email]
    @idea_id = params[:idea]
    @perk_id = params[:perk_id]
    @amount = params[:amount]
    @donation = Donation.new(
      :amount => @amount,
      :donor_id => @donor_id,
      :idea_id => @idea_id,
      :perk_id => @perk_id,
      :response_reference => @response_reference
      )
    @donor_id = current_user.id
    @idea = Idea.find(@idea_id)
    @perk = Perk.find(@perk_id)
    @donated_amount += @donation.amount
    if @donation.save 
      Idea.update(@idea_id, @donated_amount)
    #   # ProgramMailer.with(program: @program,).notify_super_admin.deliver_later
    #   #DonationMailer.with(user: @user, amount: @amount, message: @message, donation_purpose: @donation_purpose, current_realized: @updated, super_admin_email: @super_admin_email, campaign_admin_name: @campaign_admin_name, program: @program ).notify_donator.deliver_later
    #   #DonationMailer.with(user: @user, amount: @amount, message: @message, donation_purpose: @donation_purpose, current_realized: @updated, super_admin_email: @super_admin_email, campaign_admin_name: @campaign_admin_name, program: @program ).notify_super_admin.deliver_later
      render json: { success: true, full_name: current_user.fullname}
    else
      render json: { error: true }
    end
  end

  def show
    @donation = Donation.find(params[:id])
    render :show
  end
  
  private

  def donation_params
    params.permit(:donation_id, :user_id, :perk_id, :idea_id, :donor_id, :reference, :date, :amount, :phone, :first_name, :last_name, 
      perks_attributes: [:id, :_destroy, :title, :description, :amount, :quantity])
  end
end