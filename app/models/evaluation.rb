class Evaluation < ActiveRecord::Base

	after_find :check_locked

  belongs_to :usuario_avaliado, class_name: 'User'
  belongs_to :usuario_avaliador, class_name: 'User'
  belongs_to :evaluation_model

  has_many :answers, dependent: :destroy

  def check_locked
  	update(locked: true) if date < Time.now.to_datetime && !locked
  end

end
