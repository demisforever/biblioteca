class UserMailer < ApplicationMailer
    default from: "larealmiel@gmail.com"
    
    def return_receipt_email(user)
        @user = user
        emailBody = "You must return the book within the next 10 days."
        mail(to: @user.email, subject: emailBody)
    end
end
