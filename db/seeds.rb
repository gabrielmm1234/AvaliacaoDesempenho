User.destroy_all
Role.destroy_all
Area.destroy_all
Profile.destroy_all
JuniorEnterprise.destroy_all
Question.destroy_all
RequestHistory.destroy_all
AnswerOption.destroy_all
EvaluationFactor.destroy_all
EvaluationModel.destroy_all
Evaluation.destroy_all

admin = Profile.create name: 'Administrador'
usuario_comum = Profile.create name: 'Usuário Comum'
role = Role.create name: 'N/A'
junior_enterprise = JuniorEnterprise.create name: 'N/A'
area = Area.create name: 'N/A'

User.create name: 'admin', email: 'admin@admin.com', 
            profile_id: admin.id, password: '12345678', role_id: role.id,
            junior_enterprise_id: junior_enterprise.id, area_id: area.id

User.create name: 'admin1', email: 'admin@admin.com', 
            profile_id: admin.id, password: '12345678', role_id: role.id,
            junior_enterprise_id: junior_enterprise.id, area_id: area.id

User.create name: 'admin2', email: 'admin@admin.com', 
            profile_id: admin.id, password: '12345678', role_id: role.id,
            junior_enterprise_id: junior_enterprise.id, area_id: area.id

User.create name: 'admin3', email: 'admin@admin.com', 
            profile_id: admin.id, password: '12345678', role_id: role.id,
            junior_enterprise_id: junior_enterprise.id, area_id: area.id

# User.create name: 'bruno', email: 'brunohrguedes@gmail.com', 
#             profile_id: usuario_comum.id, password: '12345678', role_id: role.id,
#             junior_enterprise_id: junior_enterprise.id, area_id: area.id

# for i in 1..4 do
#   Area.create name: "Área " + i.to_s
#   Role.create name: "Cargo " + i.to_s
#   JuniorEnterprise.create name: "EJ " + i.to_s
# end