class Evaluation < ActiveRecord::Base

  after_find :lock
	after_find :unlock
  
  belongs_to :usuario_avaliado, class_name: 'User'
  belongs_to :usuario_avaliador, class_name: 'User'
  belongs_to :evaluation_model

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :usuario_avaliado, reject_if: :all_blank, allow_destroy: true

  def lock
  	update(locked: true) if date < Time.now.to_datetime && !locked
  end

  def unlock
    update(locked: false) if date > Time.now.to_datetime && locked
  end

end
