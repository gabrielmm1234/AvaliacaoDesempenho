class CreateJoinTableEvaluationFactorEvaluationModel < ActiveRecord::Migration
  def change
    create_join_table :evaluation_factors, :evaluation_models do
    end
  end
end
