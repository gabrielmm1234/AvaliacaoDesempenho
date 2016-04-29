class CreateEvaluationFactorQuestions < ActiveRecord::Migration
  def change
    create_table :evaluation_factor_questions do |t|
      t.references :evaluation_factor, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
