class DonationsController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @donations = Donation.all
  # end

  # def show
  #   set_donation
  # end

  # def new
  #   @donation = Donation.new
  # end

  # def create
  #   donation = Donation.new(donation_params)
  #   if donation.save
  #     redirect_to donations_path
  #   else
  #     flash[:notice] = "Oops!"
  #     redirect_to new_donation_path
  #   end
  # end

  # private

  # def set_donation
  #   @donation = Donation.find(params[:id])
  # end

  # def donation_params
  #   params.require(:donation).permit(:donor_id, :idea_id, :amount)
  # end

  def new
    @idea = Idea.find(params[:idea])
  end


  def create
    @idea = Idea.find(params[:idea]) 
  #   key = @idea.user.access_code
  #   Stripe.api_key = key

  #   plan_id = params[:plan]
  #   plan = Stripe::Plan.retrieve(plan_id)
  #   token = params[:stripeToken]


  #   customer = if current_user.stripe_id?
  #               Stripe::Customer.retrieve(current_user.stripe_id)
  #             else
  #               Stripe::Customer.create(email: current_user.email, source: token)
  #             end

  #   subscription = Stripe::Subscription.create({
  #     customer: customer,
  #     items: [
  #       {
  #         plan: plan
  #       }
  #     ],
  #     expand: ["latest_invoice.payment_intent"],
  #     application_fee_percent: 10,
  #   }, stripe_acccount: key)


  #   options = {
  #     stripe_id: customer.id,
  #     subscribed: true,
  #   }

  #   options.merge!(
  #     card_last4: params[:user][:card_last4],
  #     card_exp_month: params[:user][:card_exp_month],
  #     card_exp_year: params[:user][:card_exp_year],
  #     card_type: params[:user][:card_brand]
  #   )

  #   current_user.perk_subscriptions << plan_id
  #   current_user.update(options)


  #   idea_updates = {
  #     backings_count: @idea.backings_count.next,
  #     current_donation_amount: @idea.current_donation_amount + (plan.amount/100).to_i,
  #   }
  #   @idea.update(idea_updates)


  #   redirect_to root_path, notice: "Your subscription was setup successfully!"
  end

  # def destroy
  #   subscription_to_remove = params[:id]
  #   plan_to_remove = params[:plan_id]
  #   customer = Stripe::Customer.retrieve(current_user.stripe_id)
  #   customer.subscriptions.retrieve(subscription_to_remove).delete
  #   current_user.subscribed = false
  #   current_user.perk_subscriptions.delete(plan_to_remove)
  #   current_user.save
  #   redirect_to root_path, notice: "Your subscription has been cancelled."
  # end
 end
