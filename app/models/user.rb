class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :profile
  belongs_to :area
  belongs_to :role
  belongs_to :junior_enterprise

  has_many :avaliacoes_aplicadas, class_name: 'Evaluation', foreign_key: 'usuario_avaliador_id'
  has_many :avaliacoes_proprias, class_name: 'Evaluation', foreign_key: 'usuario_avaliado_id'

  validates_presence_of :email, :name, :junior_enterprise_id, :role_id, :area_id

  def admin?
    self.profile.name == "Administrador" || self.profile.name == "Admin"
  end
  
end
