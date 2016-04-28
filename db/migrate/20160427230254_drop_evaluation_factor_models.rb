class DropEvaluationFactorModels < ActiveRecord::Migration
  def change
    drop_table :evaluation_factors_models
  end
end
