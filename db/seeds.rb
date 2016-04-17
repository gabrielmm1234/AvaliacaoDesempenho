User.delete_all

admin = Profile.create name: 'Administrador'
usuario_comum = Profile.create name: 'Usuário Comum'
role = Role.create name: 'Cargo'
junior_enterprise = JuniorEnterprise.create name: 'Empresa Júnior'

User.create! name: 'admin', email: 'admin@admin.com', profile_id: admin.id, password: '12345678', role_id: role.id, junior_enterprise_id: junior_enterprise.id
