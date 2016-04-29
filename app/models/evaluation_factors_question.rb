class EvaluationFactorsQuestion < ActiveRecord::Base

  belongs_to :evaluation_factor
  belongs_to :question

end