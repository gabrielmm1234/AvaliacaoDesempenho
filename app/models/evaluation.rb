class Evaluation < ActiveRecord::Base

  after_find :lock
	after_find :unlock
  
  belongs_to :usuario_avaliado, class_name: 'User'
  belongs_to :usuario_avaliador, class_name: 'User'
  belongs_to :evaluation_model

  has_many :answers, dependent: :destroy

  def lock
  	update(locked: true) if date < Time.now.to_datetime && !locked
  end

  def unlock
    update(locked: false) if date > Time.now.to_datetime && locked
  end

end
