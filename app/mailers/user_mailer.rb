class UserMailer < ApplicationMailer
	default from: 'brainstaq@gmail.com'

	def send_welcome_email(user)
		@user = user
		mail(:to => @user.email, :subject => "Welcome to Brainstaq!")
	end

# def idea_expired_notice
#   @idea = params[:idea]

#   mail to: @idea.user.email, subject: "Your campaign has expired!"
# end

	def new_subscription(user)
			@user = user
			mail(to: @user.email, subject: 'New Subscription Invoice')
	end

	def renewal(user)
			@user = user
			mail(to: @user.email, subject: 'Subscription Renewal Invoice')
	end
end
