# Preview all emails at http://localhost:3000/rails/mailers/correos_mailer
class CorreosMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/correos_mailer/notificar
  def notificar
    CorreosMailer.notificar
  end

end
