class EvaluationModel < ActiveRecord::Base
  has_and_belongs_to_many :evaluation_factors
end
