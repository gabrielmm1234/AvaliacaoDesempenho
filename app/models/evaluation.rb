class Evaluation < ActiveRecord::Base

  belongs_to :usuario_avaliado, class_name: 'User'
  belongs_to :usuario_avaliador, class_name: 'User'
  belongs_to :evaluation_model

  has_many :answers, dependent: :destroy

end
