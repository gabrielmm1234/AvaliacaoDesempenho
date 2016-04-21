class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :usuario_avaliado
      t.references :usuario_avaliador
      t.datetime :date
      t.boolean :done
      t.references :evaluation_model, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
