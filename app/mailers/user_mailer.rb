class UserMailer < ActionMailer::Base

  default from: 'contato@concentro.org.br'

  def user_registered(user, password)
    @user = user
    @password = password
    @url = 'localhost:3000/login'
    mail(to: @user.email, subject: '[CONCENTRO] Avaliação de Desempenho - Cadastro Aceito')
  end

end
