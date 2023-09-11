class UserMailer < ApplicationMailer
    def return_receipt_email(user)
        @user = user
        emailBody = "Usted debe devolver el libro dentro de los proximos 10 dias."
        mail(to: @user.email, subject: emailBody)
    end
end
