class IdeaMailer < ApplicationMailer
  default from: 'brainstaq@gmail.com'

  def idea_created
    @idea = params[:idea]
    @user = @idea.user
    mail(to: @user.email, subject: "Your Project has been created!")
  end

  def idea_expired_notice
    @idea = params[:idea]

    mail to: @idea.user.email, subject: "Your campaign has expired!"
  end
end
