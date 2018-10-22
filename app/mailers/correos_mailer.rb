class CorreosMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.correos_mailer.notificar.subject
  #
  def notificar(tarea)
    @tarea = tarea

    mail to: "rtjuansebastian@gmail.com", subject: "Tarea nueva"
  end
end
