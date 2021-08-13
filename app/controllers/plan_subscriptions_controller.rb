class PlanSubscriptionsController < ApplicationController
  def choose_plan
    plan = params[:plan]

    @plan_subscription = current_user.plan_subscription
    if @plan_subscription.present? && @plan_subscription.update(plan: plan)
      # plan updated successfully
    else
      # plan was not updated
    end
  end
end
