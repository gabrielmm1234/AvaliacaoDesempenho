class CreateEvaluationFactors < ActiveRecord::Migration
  def change
    create_table :evaluation_factors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
