class EvaluationModel < ActiveRecord::Base

  has_many :evaluation_factors_models, dependent: :destroy
  has_and_belongs_to_many :evaluation_factors

  belongs_to :role
  has_many :areas

  accepts_nested_attributes_for :evaluation_factors_models, reject_if: :all_blank, allow_destroy: true
  
end
