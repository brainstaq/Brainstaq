class IdeasMailer < ApplicationMailer
  
  default from: 'brainstaq@gmail.com'

  def concepts_email
    @brainstorm = Brainstorm.find_by(token: params[:token])
    @concepts = @brainstorm.concepts.order(votes: :desc)
    mail(to: params[:email_address], subject: 'Result from your conception session' )
  end
end
