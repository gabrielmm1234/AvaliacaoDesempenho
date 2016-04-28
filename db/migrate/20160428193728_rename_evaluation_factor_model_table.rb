class RenameEvaluationFactorModelTable < ActiveRecord::Migration
  def change
    rename_table :evaluation_factor_models, :evaluation_factors_models
  end
end
