class AddRoleToEvaluationModel < ActiveRecord::Migration
  def change
    add_reference :evaluation_models, :role, index: true, foreign_key: true
  end
end
