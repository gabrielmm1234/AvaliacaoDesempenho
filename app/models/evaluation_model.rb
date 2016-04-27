class EvaluationModel < ActiveRecord::Base
  has_many :areas
  has_and_belongs_to_many :evaluation_factors
  belongs_to :role
end
