class UserMailer < ApplicationMailer
	default from: 'brainstaq@gmail.com'

	def send_welcome_email(user)
		@user = user
		@url  = 'https://brainstaq-0v3k.onrender.com/' 
		mail(:to => @user.email, :subject => "Welcome to Brainstaq!")
	end

	def new_subscription(user)
			@user = user
			@url  = 'https://brainstaq-0v3k.onrender.com/'
			mail(to: @user.email, subject: 'New Subscription Invoice')
	end

	def renewal(user)
			@user = user
			@url  = 'https://brainstaq-0v3k.onrender.com/'
			mail(to: @user.email, subject: 'Subscription Renewal Invoice')
	end
end
