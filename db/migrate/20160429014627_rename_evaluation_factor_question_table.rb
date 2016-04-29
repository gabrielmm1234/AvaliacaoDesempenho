class RenameEvaluationFactorQuestionTable < ActiveRecord::Migration
  def change
    rename_table :evaluation_factor_questions, :evaluation_factors_questions
  end
end
