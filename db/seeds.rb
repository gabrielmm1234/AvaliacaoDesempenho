User.delete_all

admin = Profile.create name: 'Administrador'
usuario_comum = Profile.create name: 'Usuário Comum'

User.create! name: 'admin', email: 'admin@admin.com', profile_id: admin.id, password: '12345678'
