class EvaluationFactorsModel < ActiveRecord::Base

  belongs_to :evaluation_factor
  belongs_to :evaluation_model

  accepts_nested_attributes_for :evaluation_factor, reject_if: :all_blank, allow_destroy: true
  
end
