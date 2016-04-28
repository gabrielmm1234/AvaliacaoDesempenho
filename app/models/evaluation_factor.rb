class EvaluationFactor < ActiveRecord::Base

  has_many :evaluation_model_questions
  has_and_belongs_to_many :evaluation_models
  has_and_belongs_to_many :questions

  accepts_nested_attributes_for :evaluation_model_questions, reject_if: :all_blank, allow_destroy: true
  
end
