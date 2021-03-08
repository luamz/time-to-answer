namespace :dev do
  DEFAULT_PASSWORD = 123456

  desc "Configura ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando"){%x(rails db:drop)}
      show_spinner("Criando") {%x(rails db:create)}
      show_spinner("Migrando"){%x(rails db:migrate)}
      show_spinner("Cadastrando o administrador padrão no"){%x(rails dev:add_default_admin)}
      show_spinner("Cadastrando o usuário padrão no"){%x(rails dev:add_default_user)}
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end
  
  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
    email: 'admin@admin.com',
    password: DEFAULT_PASSWORD,
    password_confirmation: DEFAULT_PASSWORD
  )
end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
    email: 'user@user.com',
    password: DEFAULT_PASSWORD,
    password_confirmation: DEFAULT_PASSWORD
    )
  end


  def show_spinner(frase)
    spinner = TTY::Spinner.new("[:spinner] #{frase} banco de dados...")
    spinner.auto_spin
    yield
    spinner.success('(Concluído!!!)')
  end
end