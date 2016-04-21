class CreateJoinTableEvaluationFactorQuestion < ActiveRecord::Migration
  def change
    create_join_table :evaluation_factors, :questions do
    end
  end
end
