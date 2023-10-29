class UserMailer < ApplicationMailer
  default from: 'ashrutpanchal111@gmail.com'

  def enhancements_email(details = {})
    @details = details
    mail(to: @details[:email], subject: "🎉🎉 LET'S ENHANCE YOUR WEBSITE 🎉🎉", Importance: 'High')
  end

  def new_website_email(details = {})
    @details = details
    mail(to: @details[:email], subject: "🎉🎉 LET'S CREATE YOUR WEBSITE 🎉🎉", Importance: 'High')
  end
end

