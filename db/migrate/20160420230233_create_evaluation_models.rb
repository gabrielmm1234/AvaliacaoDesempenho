class CreateEvaluationModels < ActiveRecord::Migration
  def change
    create_table :evaluation_models do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
