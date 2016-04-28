class DropEvaluationFactorQuestions < ActiveRecord::Migration
  def change
    drop_table :evaluation_factors_questions
  end
end
