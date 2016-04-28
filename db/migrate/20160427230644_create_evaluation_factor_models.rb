class CreateEvaluationFactorModels < ActiveRecord::Migration
  def change
    create_table :evaluation_factor_models do |t|
      t.references :evaluation_factor, index: true, foreign_key: true
      t.references :evaluation_model, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
