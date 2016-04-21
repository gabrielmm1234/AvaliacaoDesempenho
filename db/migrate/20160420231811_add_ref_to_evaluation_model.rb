class AddRefToEvaluationModel < ActiveRecord::Migration
  def change
    add_reference :evaluation_models, :evaluation_factor, index: true, foreign_key: true
  end
end
