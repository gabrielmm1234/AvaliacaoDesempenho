class UserMailer < ActionMailer::Base

  default from: 'contato@concentro.org.br'

  def user_registered(user, password)
    @user = user
    @password = password
    @url = 'http://avaliacaodesempenho.herokuapp.com/login'
    mail(to: @user.email, subject: '[CONCENTRO] Avaliação de Desempenho - Cadastro Aceito')
  end

end
