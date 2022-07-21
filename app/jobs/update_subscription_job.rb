class UpdateSubscriptionJob < ApplicationJob
  queue_as :default

  def perform 
    User.joins(:account_detail).where(account_details: {user_status: 0}).find_each do |user|
      if DateTime.now > member.account_detail.expiry_date.to_datetime 
        user.account_detail.user_status = 1
        user.save
      end
    end
  end
end

