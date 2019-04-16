class HomeMailer < ApplicationMailer
  default to: -> { User.active.pluck(:email) }, from: 'phantomfreejr@gmail.com'

  def send_email(message)
    @message = message
    mail(subject: 'This is just a random email')
  end

end
